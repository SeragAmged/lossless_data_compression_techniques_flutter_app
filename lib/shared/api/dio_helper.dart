import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://localhost:8000/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // static Future<Response> get({
  //   required String category,
  // }) async {
  //   return await dio.get(
  //     "v2/top-headlines/",
  //     queryParameters: {
  //       'country': country,
  //       'category': category,
  //       'apikey': "apikey",
  //     },
  //   );
  // }

  static Future<Response> getSearch({required String value}) async =>
      await dio.get(
        "v2/everything/",
        queryParameters: {
          'q': value,
          'apikey': "apikey",
        },
      );

  static Future<Response> post(
      {required String path, required Map<String, dynamic> message}) async {
    return await dio.post(path, queryParameters: message);
  }
}
