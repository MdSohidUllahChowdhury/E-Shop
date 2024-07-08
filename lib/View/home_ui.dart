// ignore_for_file: camel_case_types

import 'package:e_commerce_app/Controller/product_model.dart';
import 'package:e_commerce_app/Controller/shoe_details.dart';
import 'package:e_commerce_app/Controller/viewing_shoes.dart';
import 'package:flutter/material.dart';

class Home_UI extends StatefulWidget {
  const Home_UI({super.key});

  @override
  State<Home_UI> createState() => _Home_UIState();
}

class _Home_UIState extends State<Home_UI> {
  
  // ignore: non_constant_identifier_names
  final List<String> brand_name = [
  'All',
  'Adidas',
  'Nike',
  'Bata',
  'Puma'
 ];

late String selected ; //* Variable dec
@override
  void initState() {
    selected = brand_name[0]; //* init here the dec variable by using brand name index
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SafeArea(
        child: Column(
          children: [
            
            const Row(
              children: [
                Text(' Shoes \n Collection',
                 style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
                  ),
                 SizedBox(width: 8),
                Expanded(
                  child: TextField(
                   decoration: InputDecoration(
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
                    
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = brand;
                        });
                      },
                      
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 12,),
                       
                        label: Text(brand,
                        style: const TextStyle(fontSize: 16),),
                        
                        backgroundColor:
                        selected == brand ?
                        Theme.of(context).primaryColor :
                        const Color.fromRGBO(245, 247, 249, 1),

                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),  
                        ),
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    ),
                  ); 
                }
                ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                 final product = products[index];
                                 
                 return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return Details_Page(product: product);
                      }
                      )
                    );
                  },
                   child: Show_Card(
                    title:product['title'] as String , 
                    price: product['price']as double,
                    image: product['imageUrl'] as String,
                    bgcolor: index.isEven?
                     const Color.fromRGBO(216, 240, 253, 1) :
                      const Color.fromRGBO(245, 247, 249, 1)
                     ),
                 );
              }),
            )
          ],
      ),
      ),
    );
  }
}