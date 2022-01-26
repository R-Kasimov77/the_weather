import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_weather/logic/store/store.dart';

class GetWeatherAction extends ReduxAction<AppState> {
  final String city;

  GetWeatherAction({required this.city});
  @override
  Future<AppState?> reduce() async {
    final weatherModel = await store.state.repository.getWeather(city: city);

    return store.state.copyWith(
        city: weatherModel.location.name,
        temp: weatherModel.current.tempC,
        date: weatherModel.location.localtime);
  }
}
