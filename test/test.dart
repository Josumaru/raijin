import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';

void main() async {
  final Dio dio = Dio();


  const endpoint = 'https://samehadaku.email/ninja-kamui-episode-9/';

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
    int episode = int.parse(title.split('Episode ').last);
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
  print(mirrorList);
}
