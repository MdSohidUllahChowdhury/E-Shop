import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Display_Page extends StatefulWidget {
  const Display_Page({super.key});

  @override
  State<Display_Page> createState() => _Display_PageState();
}

class _Display_PageState extends State<Display_Page> {

 List<String> brand_name = [
  'All',
  'Adidas',
  'Nike',
  'Bata',
  'Puma'
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(' Shoes \n Collection',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
                  ),
                 SizedBox(width: 8,) ,
                Expanded(
                  child: TextField(
                    
                  decoration: 
                  InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1)
                      ),
                      borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                        )
                  ),
                  ),
                )  
              ],
            ),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brand_name.length,
                itemBuilder: (context,index){
                  final brand = brand_name[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(label: Text(brand)
                    ),
                  );
                  
                }
                ),
            )
          ],
        ),
      ),
      );
  }
}