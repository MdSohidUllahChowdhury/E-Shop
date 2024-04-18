import 'package:e_commerce_app/e_commerce.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const E_Commerce_App());
}

class E_Commerce_App extends StatelessWidget {
  const E_Commerce_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Display_Page(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor:Color.fromRGBO(254,206,1,1)),

          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            prefixIconColor: Colors.grey,
          )
      ),
    );
  }
}
