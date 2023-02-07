// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String title;
  final String description;
  final List<String> images;
  final double price;
  Product({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
  });

  Product copyWith({
    String? id,
    String? name,
    String? title,
    String? description,
    List<String>? images,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'images': images,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id,
      name: map['name'] as String,
      description: map['description'] as String,
      title: map['title'] as String,
      images: List<String>.from(map['images']),
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source, String id) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>, id);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, title: $title, images: $images, price: $price)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.title == title &&
        listEquals(other.images, images) &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        title.hashCode ^
        images.hashCode ^
        price.hashCode;
  }
}
