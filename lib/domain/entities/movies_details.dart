import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable{

  final String title;
  final int id;
  final String poster;
  final String releaseDate;
  final String overview;
  final List<String> genres;

  const MovieDetails({required this.title, required this.id, required this.poster, required this.releaseDate, required this.overview, required this.genres});
  @override
  List<Object?> get props => [];

}