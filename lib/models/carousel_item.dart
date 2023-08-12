import 'package:bravo_news/models/category_item.dart';

class CarouselItem {
  String title;
  CategoryItem category;
  DateTime createdDate;
  String imageSource;
  String userName;

  CarouselItem(
      {required this.title,
      required this.category,
      required this.createdDate,
      required this.imageSource,
      required this.userName});

  factory CarouselItem.fromJson(Map<String, dynamic> data){
    final title = data['title'];
    final category = CategoryItem.fromJson(data['category']);
    final createdDate = DateTime.parse(data['createdDate']);
    final imageSource = data['imageSource'];
    final userName = data['userName'];

    return CarouselItem(title: title, category:category, createdDate: createdDate, imageSource: imageSource, userName: userName);
  }
}
