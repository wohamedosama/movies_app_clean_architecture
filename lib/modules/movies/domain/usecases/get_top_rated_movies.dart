import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';
import 'package:movies_app/modules/movies/domain/repo/base_movie_repository.dart';

class GetTopRatedMovies extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMovies(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
