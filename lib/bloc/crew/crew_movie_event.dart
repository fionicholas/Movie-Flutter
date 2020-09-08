import 'package:equatable/equatable.dart';

abstract class CrewMovieEvent extends Equatable {
  final String id;

  const CrewMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadCrewMovie extends CrewMovieEvent {
  LoadCrewMovie(String id) : super(id);
}
