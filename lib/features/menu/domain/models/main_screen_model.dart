// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainScreenModel {
  final Widget screen;
  final String title;
  final String icon;
  MainScreenModel(this.screen, this.title, this.icon);
}

class MenuScreensSection {
  MenuScreensSection({
    required this.title,
    required this.screens,
  });

  final String title;
  final List<MainScreenModel> screens;

  @override
  bool operator ==(covariant MenuScreensSection other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.screens, screens);
  }

  @override
  int get hashCode => title.hashCode ^ screens.hashCode;
}
