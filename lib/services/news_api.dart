import 'package:bravo_news/models/carousel_item.dart';
import 'package:dio/dio.dart';

Future<List<CarouselItem>?> getNews() async {
  try {
    var url =
        'https://newsapi.org/v2/everything?q=starwars&from=2023-08-10&sortBy=publishedAt&apiKey=1b08c0e52b12482cb4788daf89ead749';
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      var body = res.data["articles"] as List;
      return body.map((e) => CarouselItem.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
