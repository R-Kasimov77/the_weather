import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/logic/store/action.dart';
import 'package:flutter_weather/logic/store/store.dart';
import 'package:flutter_weather/screens/main_screen/components/temperature_container.dart';
import 'package:flutter_weather/screens/main_screen/main_screen_view_model.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;
  var time = '';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainScreenViewModel>(
        model: MainScreenViewModel(),
        builder: (context, vm) {
          time = vm.date;
          return Scaffold(
            backgroundColor: Colors.blue.shade200,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 54,
                          child: TextField(
                            controller: cityController,
                            onSubmitted: (text) async {
                              setState(() {
                                isLoading = true;
                                cityController.text = '';
                              });
                              try {
                                await StoreProvider.dispatch<AppState>(
                                    context, GetWeatherAction(city: text));
                              } on Exception catch (e) {
                                print(e);
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "поиск",
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          time,
                          style: TextStyle(fontSize: 34, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          vm.city,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(
                          width: 250,
                          height: 250,
                          child: Image.asset(
                            "assets/images/cloud_image.png",
                            color: Colors.white,
                          ),
                        ),
                        TemperatureContainer(
                          temp: vm.temp,
                          isLoading: isLoading,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Text(
                          "Температура",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: 250,
                            height: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
