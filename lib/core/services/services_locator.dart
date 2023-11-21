import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/movies/data/remote_data_source/movie_remote_data_source.dart';
import 'package:movies_app/modules/movies/data/repo/movies_repository.dart';
import 'package:movies_app/modules/movies/domain/repo/base_movie_repository.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movies_details_use_case.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_recommedation_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/modules/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    //BLOC
    getIt.registerLazySingleton(() => MoviesBloc(
          getIt(),
          getIt(),
          getIt(),
        ));
    getIt.registerLazySingleton(() => MovieDetailsBloc(getIt(), getIt()));

    // USE CASE
    getIt.registerLazySingleton(() => GetNowPlayingMovies(getIt()));
    getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMovies(getIt()));
    getIt.registerLazySingleton(() => GetMoviesDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationUseCase(getIt()));

    // Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(getIt()));

    // DATA SOURCE
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
