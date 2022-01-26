import 'package:flutter_weather/logic/repository/app_repository.dart';

class AppState {
  final String city;
  final String date;
  final double temp;
  final AppRepository repository;

  AppState(
      {required this.city,
      required this.date,
      required this.temp,
      required this.repository});

  AppState copyWith({
    String? city,
    String? date,
    double? temp,
  }) {
    return AppState(
        repository: repository,
        city: city ?? this.city,
        date: date ?? this.date,
        temp: temp ?? this.temp);
  }
}
