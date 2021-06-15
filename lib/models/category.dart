import 'package:flutter/material.dart';

class Meal_Category {
  final String id;
  final String title;
  final Color color;

  const Meal_Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
