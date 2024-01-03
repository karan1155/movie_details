import 'package:bloc/bloc.dart';

import '../../../domain/entities/movies.dart';
import '../../../domain/usecases/get_movie_list.dart';
import 'event.dart';
import 'state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieList getMovieList;

  MoviesBloc(this.getMovieList) : super(MoviesInitialState()){
    on<MoviesUpcomingEvent>(upcominMovies);
  }


  void upcominMovies(
      MoviesUpcomingEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoadingState());
    final result = await getMovieList.execute();

    if (result.isRight()) {
      emit(MoviesLoadedState(movies: result.getOrElse(() => <Movie>[])));
    } else {
      emit(MoviesFailureState());
    }
  }

}
