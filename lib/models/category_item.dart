import 'package:flutter/material.dart';

class CategoryItem {
  String name;
  Color colorCode;

  CategoryItem({required this.name, required this.colorCode});

  factory CategoryItem.fromJson(Map<String, dynamic> data){
    final name = data['name'];
    final colorCode = Color(int.parse(data['colorCode'].substring(1, 7), radix: 16) + 0xFF000000);

    return CategoryItem(name: name, colorCode: colorCode);
  }
}
