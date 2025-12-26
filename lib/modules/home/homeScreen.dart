import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test/shared/components/functions.dart';

import '../../shared/components/Widgets/bottomNavBar.dart';
import '../../shared/components/Widgets/movieCard.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../movieDetails/movie_details_screen.dart';
import 'cubit/mobiecubit.dart';
import 'cubit/movieState.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getMovies(),

      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {
          if (state is MoviesErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kLogo, height: 50),
                  const SizedBox(width: 16),
                  const Text('IMDB'),
                ],
              ),
            ),
            body: Stack(
              children: [
                Positioned(top: 0, left: 0, child: Image.asset(kBlurBackground)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Top 100 Movies',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 16),


                        Expanded(
                          child: state is MoviesLoadingState
                              ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                              : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.moviesList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (context, index) {
                              var movie = cubit.moviesList[index];
                              String idToSend = 'top${index + 1}';

                              // 2. تغليف الكارت بـ InkWell عشان يبقى كليكابل
                              return InkWell(
                                onTap: () {
                                  navigateTo(context, MovieDetailsScreen(movieId: idToSend));

                                },
                                child: movieCard(
                                  movieimage: movie.image,
                                  movieName: movie.title ?? 'No Title',
                                  moviegenre: movie.genre.isNotEmpty ? movie.genre[0] : 'N/A',
                                  movieYear: movie.year,
                                  movieRank: index + 1,
                                ),
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}