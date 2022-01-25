import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController cityController = TextEditingController();
  var city = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 54,
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "поиск",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
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
                    "Mondey, 27th april",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "6:27 am",
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    city,
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
                  Text(
                    " 10°",
                    style: TextStyle(color: Colors.white, fontSize: 75),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    "Monday",
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
                  FloatingActionButton(
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          city = cityController.text;
                          cityController.text = "";
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
