import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

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
  Future<List<AnimeModel>> animeGetPopular() async {
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
          score: score,
          genre: genre.map((e) => e.text).toList(),
          type: type,
          description: description,
          status: status,
        ),
      );
    }
    return animeModel;
  }
}
