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
          'x-rapidapi-key': 'd1893ce3a3msh33334e66b7bd286p173b61jsnca4585662cdb',
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