import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel{
  final int id;
  final String title;
  final String description;
  final int price;
  final List<String> images;
  final String categoryName;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.categoryName
});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
    id: json['id'],
  title: json['title'],
  description: json['description'],
  price: json['price'],
  images:List<String>.from(json['images']),
   categoryName: json['category']['name']
  );
  }


}