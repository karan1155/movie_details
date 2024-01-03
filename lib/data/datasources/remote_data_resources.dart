import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie_model.dart';

abstract class RemoteDataSources{
  Future<MovieModelList> getMovies();
}

class GetMoviesRemote extends RemoteDataSources{

  final Dio dio;

  GetMoviesRemote({required this.dio});
  var baseUrl = dotenv.env['BASE_URL'];
  var apikey = dotenv.env['API_KEY'];
  @override
  Future<MovieModelList> getMovies() async {
    try {
      final result = await dio.get('$baseUrl/upcoming?api_key=$apikey');
      print(result.data);
//edit here after data changed
      final movie = MovieModelList.fromJson(
          result.data
      );

      return movie;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}