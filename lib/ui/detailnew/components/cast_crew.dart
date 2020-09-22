import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/crew/crew_movie_bloc.dart';
import 'package:movie_bloc_retrofit/bloc/crew/crew_movie_event.dart';
import 'package:movie_bloc_retrofit/bloc/crew/crew_movie_state.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/crew.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/ErrorImage.dart';
import 'package:movie_bloc_retrofit/ui/utils/components/LoadingIndicator.dart';
import 'package:movie_bloc_retrofit/ui/utils/ext/common_ext.dart';

class CastCrew extends StatelessWidget {
  const CastCrew({Key key, @required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.bloc<CrewMovieBloc>().add(LoadCrewMovie(id));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 160,
            child: Container(
              width: size.width,
              height: size.width / 1.7,
              child: BlocBuilder<CrewMovieBloc, CrewMovieState>(
                builder: (context, state) {
                  if (state is CrewMovieHasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        itemCount: state.crewList.crew.length,
                        itemBuilder: (BuildContext context, int index) {
                          Crew crew = state.crewList.crew[index];
                          return Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Container(
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl : "${crew.profile.toUrlImage}",
                                      placeholder: (context, url) => LoadingIndicator(),
                                      errorWidget: (context, url, error) => ErrorImage(),
                                    ),
                                    borderRadius: BorderRadius.circular(10) ,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  width: 80,
                                ),
                                SizedBox(height: 20 / 2),
                                Text(crew.realName, textAlign: TextAlign.center,),
                              ],
                            ),
                          );
                        });
                  } else if (state is CrewMovieLoading) {
                    return LoadingIndicator();
                  } else if (state is CrewMovieError) {
                    return Container(
                      child: Center(
                        child: Text(state.errorMessage),
                      ),
                    );
                  } else if (state is CrewMovieNoData) {
                    return Container(
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
                  } else if (state is CrewMovieNoInternetConnection) {
                    return Container(
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
                  } else {
                    return Center(child: Text(""));
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
