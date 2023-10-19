import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  final String name;
  final String category;
  final String corver;
  final List<String> tags;
  final int duration;
  const Movie({
    required this.name,
    required this.category,
    required this.corver,
    required this.tags,
    required this.duration,
  });

  Movie copyWith({
    String? name,
    String? category,
    String? corver,
    List<String>? tags,
    int? duration,
  }) {
    return Movie(
      name: name ?? this.name,
      category: category ?? this.category,
      corver: corver ?? this.corver,
      tags: tags ?? this.tags,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'corver': corver,
      'tags': tags,
      'duration': duration,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: (map["name"] ?? '') as String,
      category: (map["category"] ?? '') as String,
      corver: (map["corver"] ?? '') as String,
      tags: List<String>.from(
        ((map['tags'] ?? const <String>[]) as List<String>),
      ),
      duration: (map["duration"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(name: $name, category: $category, corver: $corver, tags: $tags, duration: $duration)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.category == category &&
        other.corver == corver &&
        listEquals(other.tags, tags) &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        corver.hashCode ^
        tags.hashCode ^
        duration.hashCode;
  }
}

final List<Movie> demoMovies = [
  const Movie(
    name: "Paw Patrol",
    category: "Science-fiction",
    corver: "assets/images/Paw Patrol.png",
    tags: [
      "Français",
      "Fun",
      "Animé",
    ],
    duration: 128,
  ),
  const Movie(
    name: "Expendables 4",
    category: "Adventure",
    corver: "assets/images/exp4ndables.png",
    tags: [
      "Français",
      "Fun",
      "Animé",
    ],
    duration: 117,
  ),
  const Movie(
    name: "Aya de Youpougon",
    category: "Animation",
    corver: "assets/images/Aya de Youpougon.png",
    tags: [
      "Français",
      "Fun",
      "Animé",
    ],
    duration: 126,
  ),
  const Movie(
    name: "Wonka",
    category: "Comedy",
    corver: "assets/images/Wonka.png",
    tags: [
      "Français",
      "Fun",
      "Animé",
    ],
    duration: 90,
  ),
  const Movie(
    name: "Wish, Ashia et la bonne étoile",
    category: "Action",
    corver: "assets/images/Wish.png",
    tags: [
      "Français",
      "Fun",
      "Animé",
    ],
    duration: 128,
  ),
  const Movie(
    name: "Five Nights",
    category: "Action",
    corver: "assets/images/Five nights.png",
    tags: [
      "Français",
      "Fun",
      "Animé",
    ],
    duration: 105,
  ),
];
