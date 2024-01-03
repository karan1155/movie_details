import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_details/data/datasources/remote_data_resources.dart';
import 'package:movie_details/data/repositories/movies_repositories_impl.dart';
import 'package:movie_details/domain/repositories/movies_repository.dart';
import 'package:movie_details/domain/usecases/get_movie_list.dart';
import 'package:movie_details/presentation/bloc/movie/bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<RemoteDataSources>(GetMoviesRemote(dio: sl()));

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(remoteDataSouces: sl()));

  sl.registerSingleton<GetMovieList>(GetMovieList(movieRepository: sl()));
  
  
  sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl()));
}