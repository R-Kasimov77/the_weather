import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/logic/repository/app_repository.dart';
import 'package:flutter_weather/logic/store/store.dart';
import 'package:flutter_weather/screens/main_screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: Store(
            initialState: AppState(
                city: "", date: "", temp: 0.0, repository: AppRepository())),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            home: FirstScreen()));
  }
}
