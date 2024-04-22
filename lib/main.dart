import 'package:e_commerce_app/e_commerce.dart';
import 'package:e_commerce_app/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const E_Commerce_App());
}

class E_Commerce_App extends StatelessWidget {
  const E_Commerce_App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        
        home: Display_Page(),
        debugShowCheckedModeBanner: false,
        
        
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
          seedColor:Color.fromRGBO(254,206,1,1),
          primary:Color.fromRGBO(254,206,1,1), ),
      
          inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: Colors.grey,
              hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
              ), 
            ),
          useMaterial3: true  
        ),
      ),
    );
  }
}
