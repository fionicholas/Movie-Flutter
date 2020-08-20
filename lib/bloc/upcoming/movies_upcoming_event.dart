import 'package:equatable/equatable.dart';

abstract class MoviesUpComingEvent extends Equatable {
  const MoviesUpComingEvent();

  @override
  List<Object> get props => [];
}

class LoadUpComingMovie extends MoviesUpComingEvent {}