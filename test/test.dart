// import 'package:dio/dio.dart';
// import 'package:html/dom.dart';
// import 'package:html/parser.dart';
// import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
// import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
// import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';

// void main() async {
//   final Dio dio = Dio();
//   const endpoint = 'https://samehadaku.email/?s=h';
//   final List<AnimeModel> animeList = [];
//   final response = await dio.get(endpoint);
//   final responseBody = parse(response.data);
//   final result = responseBody.getElementsByTagName('article > div');
//   for (var element in result) {
//     final String title =
//         element.getElementsByClassName('title').first.text.trim();
//     final String endpoint =
//         element.getElementsByTagName('div > a').first.attributes['href']!;
//     final String poster =
//         element.getElementsByClassName('anmsa').first.attributes['src']!;
//     final String type = element.getElementsByClassName('type').first.text;
//     final double score = double.parse(
//       element.getElementsByClassName('score').first.text == ''
//           ? '0.0'
//           : element.getElementsByClassName('score').first.text,
//     );
//     final String status = element
//         .getElementsByClassName('data')
//         .first
//         .getElementsByClassName('type')
//         .first
//         .text;
//     final List<String> genre = element
//         .getElementsByClassName('mta')
//         .first
//         .getElementsByTagName('a')
//         .map((e) => e.attributes['href']!)
//         .toList();
//     final String description =
//         element.getElementsByClassName('ttls').first.text;

//     animeList.add(AnimeModel(
//       title: title,
//       endpoint: endpoint,
//       poster: poster,
//       type: type,
//       status: status,
//       score: score,
//       genre: genre,
//       description: description,
//     ));
//   }
//   print(animeList);
// }
