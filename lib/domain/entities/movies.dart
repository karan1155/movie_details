import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String poster;
  final String title;

 const Movie({required this.id, required this.poster, required this.title});
  @override
  // TODO: implement props
  List<Object?> get props => [title,id,poster];

}