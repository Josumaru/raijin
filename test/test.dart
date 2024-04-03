import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

void main() async {
  final Dio dio = Dio();
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

  const endpoint =
      '$kAnimeEndpoint/daftar-anime-2/?order=popular&status=&type=';
  final response = await dio.get(endpoint);
  final responseBody = parse(response.data).body;
  final elements = responseBody!.getElementsByClassName('animepost');
  for (var element in elements) {
    final title = getTextByClass(element: element, className: 'title');
    final type = getTextByClass(element: element, className: 'type');
    final description = getTextByClass(element: element, className: 'ttls');
    final score =
        double.parse(getTextByClass(element: element, className: 'score'));
    final endpoint = element.getElementsByTagName('a').first.attributes['href'];
    final poster = element.getElementsByTagName('img').first.attributes['src'];
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
        score: score,
        genre: genre.map((e) => e.text).toList(),
        type: type,
        description: description,
        status: status,
      ),
    );
  }

  // final ulElements = elements.getElementsByTagName('article').first;
  // print(ulElements.text.trim().replaceAll('   ', '').replaceAll('\n\n', '\n'));
  // final List<Element> liElements = ulElements.getElementsByTagName('li');
  // for (int i = 0; i < liElements.length; i++) {
  //   final element = liElements[i].getElementsByTagName('a').first;
  //   final title = element.attributes['title'];
  //   final endpoint = element.attributes['href'];
  //   final poster = element.getElementsByTagName('img').first.attributes['src'];
  //   final episode = liElements[i].getElementsByTagName('author').first.text;

  //   final released =
  //       liElements[i].getElementsByTagName('span').last.text.split(': ')[1];
  //   animeModel.add(AnimeModel(
  //     title: title!,
  //     endpoint: endpoint!,
  //     episode: episode,
  //     poster: poster!,
  //     released: released,
  //   ));
  // }
  // print(animeModel[0]);
}
