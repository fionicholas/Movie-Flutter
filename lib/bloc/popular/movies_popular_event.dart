import 'package:equatable/equatable.dart';

abstract class MoviesPopularEvent extends Equatable {
  const MoviesPopularEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularMovie extends MoviesPopularEvent {}