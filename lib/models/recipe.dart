import 'dart:html';

class Recipe {
  final String name;
  final String images;
  final double ratings;
  final String totalTime;

  Recipe(
      {required this.name,
      required this.images,
      required this.ratings,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        ratings: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $ratings, totalTime: $totalTime}';
  }
}
