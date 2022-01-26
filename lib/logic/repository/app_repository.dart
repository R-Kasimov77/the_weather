import 'package:dio/dio.dart' as http_dio;
import 'package:flutter_weather/logic/model/weather_model.dart';

class AppRepository {
  http_dio.Dio dio = http_dio.Dio();

  Future<http_dio.Response> get(String url, {dynamic query}) async {
    try {
      var response = await dio.get(
        url,
        queryParameters: query,
      );

      return response;
    } on Exception catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<WeatherModel> getWeather({required String city}) async {
    var response = await get("http://api.weatherapi.com/v1/current.json",
        query: {"key": "5bdea08094e4432799574138222601", "q": city});

    return WeatherModel.fromJson(response.data);
  }
}
