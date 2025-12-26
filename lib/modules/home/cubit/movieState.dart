abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class MoviesLoadingState extends MoviesStates {}

class MoviesSuccessState extends MoviesStates {
  MoviesSuccessState();
}

class MoviesErrorState extends MoviesStates {
  final String error;
  MoviesErrorState(this.error);
}