import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/recommendation.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movies_details_use_case.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_recommedation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  final GetMoviesDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailsParameters(
      movieId: event.id,
    ));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetailsState: RequestState.loaded,
              movieDetails: r,
            )));
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameters(
      event.id,
    ));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationsState: RequestState.error,
              recommendationsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              recommendationsState: RequestState.loaded,
              recommendations: r,
            )));
  }
}
