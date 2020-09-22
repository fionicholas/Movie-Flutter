import 'package:equatable/equatable.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/crew.dart';

abstract class CrewMovieState extends Equatable {
  const CrewMovieState();

  @override
  List<Object> get props => [];
}

class InitialCrewMovieState extends CrewMovieState {}

class CrewMovieLoading extends CrewMovieState {}

class CrewMovieHasData extends CrewMovieState {
  final ResultCrew crewList;

  const CrewMovieHasData([this.crewList]);

  @override
  List<Object> get props => [crewList];
}

class CrewMovieNoData extends CrewMovieState {
  final String message;

  const CrewMovieNoData(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'Crew No Data (message : $message)';
}

class CrewMovieNoInternetConnection extends CrewMovieState {
  final String message;

  const CrewMovieNoInternetConnection(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Crew No Internet(message : $message)';
}

class CrewMovieError extends CrewMovieState {
  final String errorMessage;

  const CrewMovieError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Crew Failure --> message: $errorMessage';
}