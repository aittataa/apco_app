import 'package:apco_app/models/meal.dart';

class Categories {
  final int id;
  final String label;
  final String picture;
  final String description;
  final List<Meal> meals;

  Categories({
    required this.id,
    required this.label,
    required this.picture,
    required this.description,
    required this.meals,
  });
}
