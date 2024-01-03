import 'package:dartz/dartz.dart';

import 'package:movie_details/data/failure.dart';

import 'package:movie_details/domain/entities/movies.dart';

import '../../domain/repositories/movies_repository.dart';
import '../datasources/remote_data_resources.dart';
import '../exceptions.dart';

class MovieRepositoryImpl extends MovieRepository {
  final RemoteDataSources remoteDataSouces;

  MovieRepositoryImpl({required this.remoteDataSouces});

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() async{
    try{
    var results= await remoteDataSouces.getMovies();

      return Right(results.toEntityList());
    }on ServerException catch(e){

      return Left(ServerFailure("$e"));


    }



  }}