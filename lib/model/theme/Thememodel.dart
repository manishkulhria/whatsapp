import 'dart:convert';

import 'package:flutter/material.dart';

class Thememodel {
  final String title;
  final ThemeMode mode;

  Thememodel({required this.title, required this.mode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'mode': mode.name};
  }

  factory Thememodel.fromMap(Map<String, dynamic> map) {
    return Thememodel(
        title: (map["title"] ?? '') as String,
        mode: ThemeMode.values.firstWhere(
            (element) => element.name == map['mode'],
            orElse: () => ThemeMode.light));
  }

  String toJson() => json.encode(toMap());

  factory Thememodel.fromJson(String source) => Thememodel.fromMap(
      source.isEmpty ? {} : json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Thememodel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.mode == mode;
  }

  @override
  int get hashCode => title.hashCode ^ mode.hashCode;

  @override
  String toString() => 'Thememodel(title: $title, mode: $mode)';
}
