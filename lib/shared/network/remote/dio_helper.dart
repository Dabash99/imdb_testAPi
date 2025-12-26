import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://imdb-top-100-movies.p.rapidapi.com/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'x-rapidapi-host': 'imdb-top-100-movies.p.rapidapi.com',
          'x-rapidapi-key': '5f89001d07msh1d032cdb272da90p1db04ajsne64e1243f419',
        },
      ),
    );
  }

  static Future<Response> getData({
    String url = '',
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}