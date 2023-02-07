import 'dart:convert';

import 'package:poolart/models/personal_info.dart';

class Quote {
  String shape;
  int length;
  int width;
  String depth;
  String color;
  PersonalInfo? personalInfo;
  Quote({
    required this.shape,
    required this.length,
    required this.width,
    required this.depth,
    required this.color,
    this.personalInfo,
  });

  Quote copyWith({
    String? shape,
    int? length,
    int? width,
    String? depth,
    String? color,
    PersonalInfo? personalInfo,
  }) {
    return Quote(
      shape: shape ?? this.shape,
      length: length ?? this.length,
      width: width ?? this.width,
      depth: depth ?? this.depth,
      color: color ?? this.color,
      personalInfo: personalInfo ?? this.personalInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shape': shape,
      'length': length,
      'width': width,
      'depth': depth,
      'color': color,
      'personalInfo': personalInfo!.toMap(),
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      shape: map['shape'] as String,
      length: map['length'] as int,
      width: map['width'] as int,
      depth: map['depth'] as String,
      color: map['color'] as String,
      personalInfo:
          PersonalInfo.fromMap(map['personalInfo'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) =>
      Quote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quote(shape: $shape, length: $length, width: $width, depth: $depth, color: $color, personalInfo: $personalInfo)';
  }

  @override
  bool operator ==(covariant Quote other) {
    if (identical(this, other)) return true;

    return other.shape == shape &&
        other.length == length &&
        other.width == width &&
        other.depth == depth &&
        other.color == color &&
        other.personalInfo == personalInfo;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        length.hashCode ^
        width.hashCode ^
        depth.hashCode ^
        color.hashCode ^
        personalInfo.hashCode;
  }
}
