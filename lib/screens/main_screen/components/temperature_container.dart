import 'package:flutter/material.dart';
import 'package:flutter_weather/widgets/custom_loading.dart';

class TemperatureContainer extends StatelessWidget {
  final bool isLoading;
  final double temp;
  const TemperatureContainer(
      {Key? key, this.isLoading = false, required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: isLoading
          ? CustomLoading()
          : Text(
              "$temp°",
              style: TextStyle(color: Colors.white, fontSize: 75),
            ),
    );
  }
}
