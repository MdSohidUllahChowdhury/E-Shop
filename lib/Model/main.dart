import 'package:e_commerce_app/View/e_commerce.dart';
import 'package:e_commerce_app/Model/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const E_Commerce_App());
}
// ignore: camel_case_types
class E_Commerce_App extends StatelessWidget {
  const E_Commerce_App({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) 
        => CartProvider(),
      child: ScreenUtilInit(
        designSize: const Size(360, 680),
        builder: (context, child)
         => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Display_Page(),
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
            seedColor:const Color.fromRGBO(254,206,1,1),
            primary:const Color.fromRGBO(254,206,1,1),
            ),
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Colors.grey,
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
              ), 
              ),
            useMaterial3: true  
          ),
        ),
      ),
    );
  }
}
