import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/data/models/episode_model.dart';

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  final Dio dio;

  AnimeRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<AnimeModel>> animeGetNew({required int page}) async {
    final List<AnimeModel> listAnimeModel = [];
    final endpoint =
        page == 1 ? '$kAnimeEndpoint/' : '$kAnimeEndpoint/page/$page/';
    final response = await dio.get(endpoint);
    final responseBody = parse(response.data).body;
    final elements = responseBody!.getElementsByClassName('post-show')[0];
    final ulElements = elements.getElementsByTagName('ul').first;
    final List<Element> liElements = ulElements.getElementsByTagName('li');
    for (int i = 0; i < liElements.length; i++) {
      final element = liElements[i].getElementsByTagName('a').first;
      final title = element.attributes['title'];
      final endpoint = element.attributes['href'];
      final poster =
          element.getElementsByTagName('img').first.attributes['src'];
      final episode = liElements[i].getElementsByTagName('author').first.text;
      final released =
          liElements[i].getElementsByTagName('span').last.text.split(': ')[1];
      listAnimeModel.add(AnimeModel(
        title: title!,
        endpoint: endpoint!,
        episode: episode,
        poster: poster!,
        released: released,
      ));
    }
    return listAnimeModel;
  }

  @override
  Future<List<AnimeModel>> animeGet({
    required String status,
    required String order,
    required String type,
  }) async {
    final List<AnimeModel> animeModel = [];

    String getTextByClass(
        {required Element element, required String className, String? attr}) {
      if (attr != null) {
        final data =
            element.getElementsByClassName(className).first.attributes[attr];
        return data!;
      }
      final data = element.getElementsByClassName(className).first.text;
      return data;
    }

    String endpoint =
        '$kAnimeEndpoint/daftar-anime-2/?order=$order&status=$status&type=$type';
    final response = await dio.get(endpoint);
    final responseBody = parse(response.data).body;
    final elements = responseBody!.getElementsByClassName('animepost');
    for (var element in elements) {
      final title = getTextByClass(element: element, className: 'title');
      final type = getTextByClass(element: element, className: 'type');
      final description = getTextByClass(element: element, className: 'ttls');
      String score = getTextByClass(element: element, className: 'score');
      double doubleScore = score == ' ' ? 0.0 : double.parse(score);

      final endpoint =
          element.getElementsByTagName('a').first.attributes['href'];
      final poster =
          element.getElementsByTagName('img').first.attributes['src'];
      final genre =
          element.getElementsByClassName('mta').first.getElementsByTagName('a');
      final status = element
          .getElementsByClassName('data')
          .first
          .getElementsByClassName('type')
          .first
          .text;
      animeModel.add(
        AnimeModel(
          title: title,
          endpoint: endpoint!,
          poster: poster!,
          score: doubleScore,
          genre: genre.map((e) => e.text).toList(),
          type: type,
          description: description,
          status: status,
        ),
      );
    }
    return animeModel;
  }

  @override
  Future<AnimeModel> animeDetail({required String endpoint}) async {
    String getTextByClass({
      required Element element,
      required String className,
      String? attr,
    }) {
      if (attr != null) {
        final data =
            element.getElementsByClassName(className).first.attributes[attr];
        return data!;
      }
      final data = element.getElementsByClassName(className).first.text;
      return data;
    }

    double score = 0.0;
    final detailEndpoint = '$kAnimeEndpoint/anime/$endpoint';
    final response = await dio.get(detailEndpoint);
    final responseBody = parse(response.data).body;
    final elements = responseBody!.getElementsByClassName('infox').last;
    final detailElements = elements.getElementsByTagName('span');
    final title = elements
        .getElementsByClassName('anim-detail')
        .first
        .text
        .replaceAll('Detail Anime', '')
        .trim();
    final description = responseBody
        .getElementsByClassName('entry-content entry-content-single')
        .first
        .text
        .trim();
    final poster =
        getTextByClass(element: responseBody, className: 'anmsa', attr: 'src');
    final genres = responseBody
        .getElementsByClassName('genre-info')
        .first
        .getElementsByTagName('a');
    final trailer = responseBody
        .getElementsByClassName('player-embed')
        .first
        .getElementsByTagName('iframe')
        .first
        .attributes['src'];
    final episodeElements = responseBody
        .getElementsByClassName('listeps')
        .first
        .getElementsByTagName('ul')
        .first
        .getElementsByTagName('li');
    try {
      final data = responseBody
          .getElementsByClassName('archiveanime-rating')
          .first
          .getElementsByTagName('span')
          .first
          .text;
      score = double.parse(data);
    } catch (e) {
      score = 0.0;
    }
    List<EpisodeModel> episodeList = [];
    for (final item in episodeElements) {
      int episode;
      try {
        episode = int.parse(
            getTextByClass(element: item, className: 'eps').split(' ')[0]);
      } catch (e) {
        episode = 0;
      }
      final title = getTextByClass(element: item, className: 'lchx');
      final date = getTextByClass(element: item, className: 'date');
      final endpoint = item.getElementsByTagName('a').first.attributes['href'];
      episodeList.add(EpisodeModel(
          episode: episode, title: title, date: date, endpoint: endpoint!));
    }
    List<String> genre = [];
    for (final item in genres) {
      genre.add(item.attributes['href']!.split('/').last);
    }
    late String japanese = '';
    late String english = '';
    late String status = '';
    late String source = '';
    late String type = '';
    late String duration = '';
    late String season = '';
    late String studio = '';
    late String producers = '';
    late String released = '';
    late int totalEpisode = 0;

    for (final element in detailElements) {
      final separator = element.getElementsByTagName('b').first.text.trim();
      final data = element.text.replaceAll(separator, '').trim();
      switch (separator) {
        case 'Japanese':
          japanese = data;
        case 'English':
          english = data;
        case 'Status':
          status = data;
        case 'Type':
          type = data;
        case 'Source':
          source = data;
        case 'Duration':
          try {
            duration = int.parse(data) as String;
          } catch (e) {
            duration = data;
          }
        case 'Total Episode':
          try {
            totalEpisode = int.parse(data);
          } catch (e) {
            totalEpisode = 0;
          }
        case 'Season':
          season = data;
        case 'Studio':
          studio = data;
        case 'Producers':
          producers = data;
        case 'Rilis:':
          released = data;
        default:
          continue;
      }
    }
    AnimeModel animeModel = AnimeModel(
      endpoint: endpoint,
      poster: poster,
      title: title,
      japanese: japanese,
      english: english,
      status: status,
      type: type,
      source: source,
      duration: duration,
      totalEpisode: totalEpisode,
      season: season,
      studio: studio,
      producers: producers,
      released: released,
      score: score,
      description: description,
      trailer: trailer,
      genre: genre,
      episodeList: episodeList,
    );
    return animeModel;
  }
}
