import 'package:e_commerce_app/Widgets/brand_chips.dart';
import 'package:e_commerce_app/Widgets/utils_home_ui.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Utils.customBar(),
            const BrandChips(),
            Utils.shoesDisplay()
          ],
        ),
      ),
    );
  }
}
