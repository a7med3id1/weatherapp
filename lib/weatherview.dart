//import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/model.dart'; // Adjust the import path as needed

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final cityController = TextEditingController(text: "Cairo");
  bool isLoading = false;
  WeatherData? model;
  String _getIconPath(String iconCode) {
    // Define your local icons for different weather codes
    switch (iconCode) {
      case '01d':
        return 'assets/icons/sunrise 2.png'; // Clear sky day
      case '01n':
        return 'assets/icons/sunrise 2.png'; // Clear sky night
      case '02d':
        return 'assets/icons/Cloud 2.png'; // Few clouds day
      case '02n':
        return 'assets/icons/Cloud 2.png'; // Few clouds night
      case '03d':
      case '03n':
        return 'assets/icons/Cloud 2.png'; // Scattered clouds
      case '04d':
      case '04n':
        return 'assets/icons/Cloud 2.png'; // Broken clouds
      case '09d':
      case '09n':
        return 'assets/icons/Raining 1.png'; // Shower rain
      case '10d':
        return 'assets/icons/Raining 1.png'; // Rain day
      case '10n':
        return 'assets/icons/Raining 1.png'; // Rain night
      case '11d':
      case '11n':
        return 'assets/icons/Thunder 1.png'; // Thunderstorm
      case '13d':
      case '13n':
        return 'assets/icons/hurricane 1.png'; // Snow
      case '50d':
      case '50n':
        return 'assets/icons/hurricane 1.png'; // Mist
      default:
        return 'assets/icons/Wave 1.png'; // Default icon
    }
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await Dio().get(
          "https://api.openweathermap.org/data/2.5/weather?q=${cityController.text}&appid=979e237b0f5e09e3c71616ac4781af58&units=metric");
      model = WeatherData.fromJson(response.data);
    } catch (e) {
      print("Error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 97, 141),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'Search City',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      getData();
                    },
                  ),
                ),
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : model != null
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              model!.name,
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            ),
                            SizedBox(
                              child: Image.asset(
                                _getIconPath(model!.weather[0].icon),
                                fit: BoxFit.fill,
                                height: 150,
                                width: 200,
                              ),
                            ),
                            Text("${model!.main.temp.toString()}C",
                                style: const TextStyle(
                                    fontSize: 50, color: Colors.white)),
                            Text(model!.clouds.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))
                          ],
                        )
                      : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
