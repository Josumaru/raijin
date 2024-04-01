import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

void main() async {
  final List<AnimeModel> animeModel = [];
  final Dio dio = Dio();
  const endpoint = '$kAnimeEndpoint/';
  final response = await dio.get(endpoint);
  final responseBody = parse(response.data).body;
  final elements = responseBody!.getElementsByClassName('post-show')[0];
  final ulElements = elements.getElementsByTagName('ul').first;
  final List<Element> liElements = ulElements.getElementsByTagName('li');
  for (int i = 0; i < liElements.length; i++) {
    final element = liElements[i].getElementsByTagName('a').first;
    final title = element.attributes['title'];
    final endpoint = element.attributes['href'];
    final poster = element.getElementsByTagName('img').first.attributes['src'];
    final episode = liElements[i].getElementsByTagName('author').first.text;

    final released =
        liElements[i].getElementsByTagName('span').last.text.split(': ')[1];
    animeModel.add(AnimeModel(
      title: title!,
      endpoint: endpoint!,
      episode: episode,
      poster: poster!,
      released: released,
    ));
  }
  print(animeModel[0]);
}
