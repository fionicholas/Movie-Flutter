import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesUpComingState extends Equatable {
  const MoviesUpComingState();

  @override
  List<Object> get props => [];
}

class InitialMoviesUpComingState extends MoviesUpComingState {}

class MoviesUpComingLoading extends MoviesUpComingState {}

class MoviesUpComingHasData extends MoviesUpComingState {
  final List<MoviesItem> movieList;

  const MoviesUpComingHasData([this.movieList]);

  @override
  List<Object> get props => [movieList];
}

class MoviesUpComingNoData extends MoviesUpComingState {
  final String message;

  const MoviesUpComingNoData(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Data (message : $message)';
}

class MoviesUpComingNoInternetConnection extends MoviesUpComingState {
  final String message;

  const MoviesUpComingNoInternetConnection(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Internet(message : $message)';
}

class MoviesUpComingError extends MoviesUpComingState {
  final String errorMessage;

  const MoviesUpComingError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Movies Failure --> message: $errorMessage';
}