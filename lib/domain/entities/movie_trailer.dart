import 'package:equatable/equatable.dart';

class MovieTrailer extends Equatable{

  final String title;
  final String key;
  final String type;

  const MovieTrailer({required this.title, required this.key, required this.type});
  @override
  List<Object?> get props => [];

}