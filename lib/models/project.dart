// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final String id;
  final String name;
  final String title;
  final String description;
  final List<String> features;
  final List<String> keyPoints;
  final List<String> images;
  final bool? isRenovation;
  final bool? isConstruction;
  Project({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.features,
    required this.keyPoints,
    required this.images,
    this.isRenovation,
    this.isConstruction,
  });

  Project copyWith({
    String? id,
    String? name,
    String? title,
    String? description,
    List<String>? features,
    List<String>? keyPoints,
    List<String>? images,
    bool? isRenovation,
    bool? isConstruction,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      features: features ?? this.features,
      keyPoints: keyPoints ?? this.keyPoints,
      images: images ?? this.images,
      isRenovation: isRenovation ?? this.isRenovation,
      isConstruction: isConstruction ?? this.isConstruction,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'features': features,
      'keyPoints': keyPoints,
      'images': images,
      'isRenovation': isRenovation,
      'isConstruction': isConstruction,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map, String id) {
    return Project(
      id: id,
      name: map['name'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      features: List<String>.from(map['features']),
      keyPoints: List<String>.from(map['keyPoints']),
      images: List<String>.from(map['images']),
      isRenovation: map['isRenovation'] ?? false,
      isConstruction: map['isConstruction'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source, String id) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>, id);

  @override
  String toString() {
    return 'Project(id: $id, name: $name, title: $title, description: $description, features: $features, keyPoints: $keyPoints, images: $images, isRenovation: $isRenovation, isConstruction: $isConstruction)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.title == title &&
        other.description == description &&
        listEquals(other.features, features) &&
        listEquals(other.keyPoints, keyPoints) &&
        listEquals(other.images, images) &&
        other.isRenovation == isRenovation &&
        other.isConstruction == isConstruction;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        title.hashCode ^
        description.hashCode ^
        features.hashCode ^
        keyPoints.hashCode ^
        images.hashCode ^
        isRenovation.hashCode ^
        isConstruction.hashCode;
  }

  where(bool Function(dynamic element) param0) {}
}
