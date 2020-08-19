import 'package:movie_bloc_retrofit/model/movies_item.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class InitialMoviesState extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesHasData extends MoviesState {
  final List<MoviesItem> movieList;

  const MoviesHasData([this.movieList]);

  @override
  List<Object> get props => [movieList];
}

class MoviesNoData extends MoviesState {
  final String message;

  const MoviesNoData(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Data (message : $message)';
}

class MoviesNoInternetConnection extends MoviesState {
  final String message;

  const MoviesNoInternetConnection(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Internet(message : $message)';
}

class MoviesError extends MoviesState {
  final String errorMessage;

  const MoviesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Movies Failure --> message: $errorMessage';
}