import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/data/models/episode_model.dart';

void main() async {
  final Dio dio = Dio();

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

  const endpoint =
      'https://samehadaku.email/anime/dekisokonai-to-yobareta-motoeiyuu-wa-jikka-kara-tsuihou-sareta-node-sukikatte-ni-ikiru-koto-ni-shita/';
  final response = await dio.get(endpoint);
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
  double score;
  try {
    score = double.parse(
      responseBody
          .getElementsByClassName('archiveanime-rating')
          .first
          .getElementsByTagName('span')
          .first
          .text,
    );
  } catch (e) {
    score = 0.0;
  }
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
  List<EpisodeModel> episodeList = [];
  for (final item in episodeElements) {
    final episode = int.parse(
        getTextByClass(element: item, className: 'eps').split(' ')[0]);
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
        source = data.split(' ')[0];
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
  // print(animeModel);
}
