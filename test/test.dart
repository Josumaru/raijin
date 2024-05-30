
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

void main() async {
  final Dio dio = Dio();
  const endpoint =
      'https://samehadaku.email/daftar-anime-2/?order=latest&status=&type=';
  final List<String> genres = [];
  final response = await dio.get(endpoint);
  final responseBody = parse(response.data);
  final elements = responseBody.body!.getElementsByClassName('tax_fil');
  for(var element in elements){
    genres.add(element.getElementsByTagName('input').first.attributes['value']!.trim());
  }
}
