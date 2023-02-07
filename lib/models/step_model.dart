// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class StepModel {
  final IconData icon;
  final String text;
  bool isDone;
  bool isActive;
  StepModel({
    required this.icon,
    required this.text,
    required this.isDone,
    required this.isActive,
  });

  StepModel copyWith({
    IconData? icon,
    String? text,
    bool? isDone,
    bool? isActive,
  }) {
    return StepModel(
      icon: icon ?? this.icon,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon.codePoint,
      'text': text,
      'isDone': isDone,
      'isActive': isActive,
    };
  }

  factory StepModel.fromMap(Map<String, dynamic> map) {
    return StepModel(
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      text: map['text'] as String,
      isDone: map['isDone'] as bool,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StepModel.fromJson(String source) =>
      StepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StepModel(icon: $icon, text: $text, isDone: $isDone, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant StepModel other) {
    if (identical(this, other)) return true;

    return other.icon == icon &&
        other.text == text &&
        other.isDone == isDone &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return icon.hashCode ^ text.hashCode ^ isDone.hashCode ^ isActive.hashCode;
  }
}
