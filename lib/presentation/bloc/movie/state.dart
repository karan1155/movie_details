import '../../../domain/entities/movies.dart';

class MoviesState  {


}

final class MoviesInitialState extends MoviesState {}
final class MoviesLoadedState extends MoviesState {
final List<Movie> movies;

 MoviesLoadedState({required this.movies});

}
final class MoviesFailureState extends MoviesState {}
final class MoviesLoadingState extends MoviesState {}
