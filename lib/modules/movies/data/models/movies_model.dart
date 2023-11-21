import 'package:movies_app/modules/movies/domain/entities/movies.dart';

class MoviesModel extends Movie {
  const MoviesModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.genreId,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        genreId: List<int>.from(json['genre_ids'].map((e) => e)),
        overView: json['overview'],
        releaseDate: json['release_date'],
        // TODO CHECK THIS
        voteAverage: json['vote_average'].toDouble(),
      );
}
