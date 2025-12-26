import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test/shared/network/remote/dio_helper.dart';
import '../../../models/movieModel.dart';
import 'moviedetailsstats.dart';


class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  MovieDetailsCubit() : super(MovieDetailsInitialState());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  MovieModel? movieDetails;

  void getMovieDetails(String movieId) {
    emit(MovieDetailsLoadingState());

    DioHelper.getData(url: movieId).then((value) {

      movieDetails = MovieModel.fromJson(value.data);

      emit(MovieDetailsSuccessState(movieDetails!));

    }).catchError((error) {
      print('Error in Details: ${error.toString()}');
      emit(MovieDetailsErrorState(error.toString()));
    });
  }
}