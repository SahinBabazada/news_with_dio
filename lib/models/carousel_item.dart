import 'package:bravo_news/models/category_item.dart';
import 'package:flutter/material.dart';

class CarouselItem {
  String title;
  CategoryItem category;
  DateTime createdDate;
  String? imageSource;
  String? userName;

  CarouselItem(
      {required this.title,
      required this.category,
      required this.createdDate,
      required this.imageSource,
      required this.userName});

  factory CarouselItem.fromJson(Map<String, dynamic> data){
    final title = data['title'];
    final category = CategoryItem(name: "Star wars", colorCode: const Color(0xFFA11111));
    final createdDate = DateTime.parse(data['publishedAt']);
    final imageSource = data['urlToImage'];
    final userName = data['author'];

    return CarouselItem(title: title, category:category, createdDate: createdDate, imageSource: imageSource, userName: userName);
  }
}
