import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';
import '../../utils/get_image_url.dart';
import '../bloc/movie/bloc.dart';
import '../bloc/movie/event.dart';
import '../bloc/movie/state.dart';



class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final countyController = TextEditingController();
  @override
  void dispose() {
    countyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesBloc = BlocProvider.of<MoviesBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,

      body: BlocBuilder<MoviesBloc, MoviesState>(
        bloc: moviesBloc,
        builder: (context, state) {
          if (state is MoviesInitialState) {
            moviesBloc.add(
              MoviesUpcomingEvent(),
            );
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoadedState) {
            return Column(
              children: [GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const MovieSearchScreen(),
                  //     ));
                },
                child: SingleChildScrollView(physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    width: 80.w,height: 50,
                    margin:
                    const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
                    // padding:const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.onAppBarColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Watch",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: CustomColors.blackTextColor),
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.search_rounded,
                            color: CustomColors.blackTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
                Container(height: 80.h,
                    child: ListView.builder(
                      itemCount: state.movies.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const MoviesDetailScreen(),
                            //     ));
                            // moviesBloc.add(MovieDetailEvent(
                            //     movieId: state.movies[index].id.toString())
                           // );
                          },
                          child: Container(
                            width: 80.w,
                            height: 20.h,
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            //padding: EdgeInsets.all(5),
                            alignment: const Alignment(-1, 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  getImageUrl(state.movies[index].poster),
                                ),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  gradient: CustomColors.lineargradient),
                              child: Text(
                                state.movies[index].title,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                        );
                      },
                    )

                  //  Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(state..name),
                  //     Text(state.county.population.toString()),
                  //     Image.network(state.county.flags.first)
                  //   //  Text(state.county.flags.first),
                  //  ,   ElevatedButton(
                  //       onPressed: () {
                  //         countryBloc.add( CountryResetEvent());
                  //       },
                  //       child: const Text("Reset"),
                  //     )
                  //   ],
                  // ),
                ),
              ],
            );
          }
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Find TV shows, Movies and lot more"),
                  ElevatedButton(
                    onPressed: () {
                      moviesBloc.add(MoviesResetEvent());
                    },
                    child: const Text("Reset"),
                  )
                ],
              ));
        },
      ),
    );
  }
}