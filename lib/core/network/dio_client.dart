import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout:  Duration(seconds: 10),
            receiveTimeout:  Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
              'x-rapidapi-host': ApiConstants.rapidApiHost,
              'x-rapidapi-key': ApiConstants.rapidApiKey,
            },
          ),
        );
}