import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesPopularState extends Equatable {
  const MoviesPopularState();

  @override
  List<Object> get props => [];
}

class InitialMoviesPopularState extends MoviesPopularState {}

class MoviesPopularLoading extends MoviesPopularState {}

class MoviesPopularHasData extends MoviesPopularState {
  final List<MoviesItem> movieList;

  const MoviesPopularHasData([this.movieList]);

  @override
  List<Object> get props => [movieList];
}

class MoviesPopularNoData extends MoviesPopularState {
  final String message;

  const MoviesPopularNoData(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Data (message : $message)';
}

class MoviesPopularNoInternetConnection extends MoviesPopularState {
  final String message;

  const MoviesPopularNoInternetConnection(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Internet(message : $message)';
}

class MoviesPopularError extends MoviesPopularState {
  final String errorMessage;

  const MoviesPopularError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Movies Failure --> message: $errorMessage';
}