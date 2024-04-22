import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';

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
    final elements = responseBody!.getElementsByClassName('post-show').first;
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
    required int page,
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
        '$kAnimeEndpoint/daftar-anime-2/page/$page/?order=$order&status=$status&type=$type';
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
            duration = data.split(' ')[0];
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

  @override
  Future<List<VideoModel>> animeVideo({required String endpoint}) async {
    List<VideoModel> mirrorList = [];
    List<EpisodeModel> episodeList = [];

    final response = await dio.get(endpoint);
    final responseBody = parse(response.data);
    String title = responseBody
        .getElementsByClassName('entry-title')
        .first
        .text
        .replaceFirst(' Sub Indo', '');

    List<Element> listEpisode = responseBody
        .getElementsByClassName('listeps')
        .first
        .getElementsByTagName('ul > li');
    for (var element in listEpisode) {
      String title = element.getElementsByTagName('div > span').first.text;
      int episode = int.parse(title.split('Episode ').last.split(' ')[0]);
      String date = element.getElementsByClassName('date').first.text;
      String endpoint =
          element.getElementsByTagName('div > a').first.attributes['href']!;
      String poster = element
          .getElementsByClassName('thumbnailrighteps')
          .first
          .getElementsByTagName('a > img')
          .first
          .attributes['src']!;
      episodeList.add(EpisodeModel(
        endpoint: endpoint,
        episode: episode,
        title: title,
        date: date,
        poster: poster,
      ));
    }

    List<Element> navigationEpisode = responseBody
        .getElementsByClassName('naveps')
        .first
        .getElementsByTagName('div > a');

    String prevEpisode = navigationEpisode.first.attributes['href']!;
    String nextEpisode = navigationEpisode.last.attributes['href']!;

    final downloadElement = responseBody.body!
        .getElementsByClassName('download-eps')
        .first
        .getElementsByTagName('ul > li');

    for (final element in downloadElement) {
      String serverQuality = element.getElementsByTagName('strong').first.text;
      for (final server in element.getElementsByTagName('> span > a')) {
        String mirror = server.text.trim().toLowerCase();
        if (mirror.contains('kraken')) {
          final Response mirrorResponse =
              await dio.get(server.attributes['href']!);
          final Element mirrorAttributes =
              parse(mirrorResponse.data).getElementById('my-video')!;
          mirrorList.add(
            VideoModel(
              quality: serverQuality,
              mirror: mirror,
              endpoint: 'https:${mirrorAttributes.attributes['data-src-url']!}',
              poster: 'https:${mirrorAttributes.attributes['poster']!}',
              anotherEpisode: episodeList,
              nextEpisode: nextEpisode,
              prevEpisode: prevEpisode,
              title: title,
            ),
          );
        }
      }
    }
    return mirrorList;
  }

  @override
  Future<List<ScheduleModel>> animeSchedule({required String day}) async {
    final endpoint =
        '$kAnimeEndpoint/wp-json/custom/v1/all-schedule?day=$day&type=schtml';
    final response = await dio.get(endpoint);
    final List<ScheduleModel> animeList =
        (response.data as List).map((e) => ScheduleModel.fromJson(e)).toList();
    return animeList;
  }

  @override
  Future<List<AnimeModel>> animeSearch({required String query}) async {
    final List<AnimeModel> animeList = [];
    final String endpoint = '$kAnimeEndpoint/?s=$query';
    final response = await dio.get(endpoint);
    final responseBody = parse(response.data);
    final result = responseBody.getElementsByTagName('article > div');
    for (var element in result) {
      final String title =
          element.getElementsByClassName('title').first.text.trim();
      final String endpoint =
          element.getElementsByTagName('div > a').first.attributes['href']!;
      final String poster =
          element.getElementsByClassName('anmsa').first.attributes['src']!;
      final String type = element.getElementsByClassName('type').first.text;
      final double score = double.parse(
          element.getElementsByClassName('score').first.text == ''
              ? '0.0'
              : element
                  .getElementsByClassName('score')
                  .first
                  .text
                  .replaceAll(',', '.')
                  .trim());
      final String status = element
          .getElementsByClassName('data')
          .first
          .getElementsByClassName('type')
          .first
          .text;
      final List<String> genre = element
          .getElementsByClassName('mta')
          .first
          .getElementsByTagName('a')
          .map((e) => e.attributes['href']!)
          .toList();
      final String description =
          element.getElementsByClassName('ttls').first.text;

      animeList.add(AnimeModel(
        title: title,
        endpoint: endpoint,
        poster: poster,
        type: type,
        status: status,
        score: score,
        genre: genre,
        description: description,
      ));
    }
    return animeList;
  }
}
