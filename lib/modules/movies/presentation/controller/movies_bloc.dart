import 'package:bloc/bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies topRatedMovies;

  MoviesBloc(
    this.getNowPlayingMovies,
    this.getPopularMovies,
    this.topRatedMovies,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvents>((event, emit) async {
      final result = await getNowPlayingMovies(const NoParameters());
      //emit(const MoviesState(nowPlayingState: RequestState.loading));
      result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMoviesMessage: l.message)),
        (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });
    on<GetPopularMoviesEvents>((event, emit) async {
      final result = await getPopularMovies(const NoParameters());
      // emit(const MoviesState(popularState: RequestState.loading));
      result.fold(
          (l) => emit(state.copyWith(
              popularState: RequestState.error, popularMessage: l.message)),
          (r) => emit(state.copyWith(
                popularState: RequestState.loaded,
                popularMovies: r,
              )));
    });

    on<GetTopRatedMoviesEvents>((event, emit) async {
      final result = await topRatedMovies(const NoParameters());
      // emit(const MoviesState(topRatedState: RequestState.loading));
      result.fold(
          (l) => emit(state.copyWith(
              topRatedState: RequestState.error, topRatedMessage: l.message)),
          (r) => emit(state.copyWith(
              topRatedMovies: r, topRatedState: RequestState.loaded)));
    });
  }
}
