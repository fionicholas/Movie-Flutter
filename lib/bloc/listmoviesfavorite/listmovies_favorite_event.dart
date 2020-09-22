import 'package:equatable/equatable.dart';

abstract class ListMoviesFavoriteEvent extends Equatable {
  final String query;

  const ListMoviesFavoriteEvent({this.query});

  @override
  List<Object> get props => [query];
}

class GetListMoviesFavorite extends ListMoviesFavoriteEvent {
  GetListMoviesFavorite({String query}) : super(query: query);
}
