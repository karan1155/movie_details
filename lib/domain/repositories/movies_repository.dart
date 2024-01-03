import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/movies.dart';

abstract class MovieRepository{
Future<Either<Failure,List<Movie>>> getUpcomingMovies();
}