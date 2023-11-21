import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final List<int> genreId;
  final String overView;
  final num voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.genreId,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        title,
        genreId,
        overView,
        voteAverage,
        releaseDate,
      ];
}
