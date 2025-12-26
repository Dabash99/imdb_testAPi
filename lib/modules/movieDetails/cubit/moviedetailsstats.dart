
import '../../../models/movieModel.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsSuccessState extends MovieDetailsStates {
  final MovieModel movieModel;
  MovieDetailsSuccessState(this.movieModel);
}

class MovieDetailsErrorState extends MovieDetailsStates {
  final String error;
  MovieDetailsErrorState(this.error);
}