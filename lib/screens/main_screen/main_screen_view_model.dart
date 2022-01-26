import 'package:async_redux/async_redux.dart';
import 'package:flutter_weather/logic/store/store.dart';

class MainScreenViewModel extends BaseModel<AppState> {
  MainScreenViewModel();
  late String city;
  late String date;
  late double temp;

  MainScreenViewModel.builder(
      {required this.city, required this.date, required this.temp})
      : super(equals: [city, date, temp]);

  @override
  BaseModel fromStore() {
    return MainScreenViewModel.builder(
        city: state.city, date: state.date, temp: state.temp);
  }
}
