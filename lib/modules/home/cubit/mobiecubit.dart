import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/movieModel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'movieState.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesInitialState());

  static MoviesCubit get(context) => BlocProvider.of(context);

  List<MovieModel> moviesList = [];

  void getMovies() {
    emit(MoviesLoadingState());

    DioHelper.getData(url: '').then((value) {

      moviesList = [];
      if (value.data is List) {
        value.data.forEach((element) {
          moviesList.add(MovieModel.fromJson(element));
        });
      }

      print('3. طول الليستة بعد التحويل: ${moviesList.length}');

      emit(MoviesSuccessState());

    }).catchError((error) {
      print('!!! حصل مشكلة: ${error.toString()}');
      emit(MoviesErrorState(error.toString()));
    });
  }

}