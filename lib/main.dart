import 'package:clima_calc/apps/clima/screens/city.dart';
import 'package:flutter/material.dart';

import 'package:clima_calc/screens/home.dart';

import 'package:clima_calc/apps/calculator/main.dart';
import 'package:clima_calc/apps/clima/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const Home());
          case '/calc':
            return MaterialPageRoute(builder: (context) => const Calc());
          case '/clima':
            if (settings.arguments == null) {
              return MaterialPageRoute(builder: (context) => const Clima());
            } else {
              return MaterialPageRoute(
                  builder: (context) =>
                      Clima(city: settings.arguments as String));
            }
          case '/city_page':
            return MaterialPageRoute(
                builder: (context) =>
                    CityPage(weatherData: settings.arguments));
        }
      },
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.white70),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 30, color: Colors.grey),
          bodyText1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: const Home(),
    );
  }
}
