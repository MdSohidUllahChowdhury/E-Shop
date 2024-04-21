//import 'dart:ffi';

import 'package:flutter/material.dart';

class Details_Page extends StatefulWidget {



  final Map<String,Object> product_name;
   Details_Page({
    super.key, required this.product_name
    });
  
  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  int size_selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Details',
        style:TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        ),

        body: Column(
          children: [
            Center(
              child: Text(widget.product_name['title']as String,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                    ),    
            ),

            //Spacer(),
            Image.asset(widget.product_name['imageUrl'] as String),
            //Spacer(),

           // Text(product_name['price'] as dynamic)

           Container(
            height: 100,
            child: Column(
              children: [
                Text('\$${widget.product_name['price']}',style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                    ),
                SizedBox(height: 10,),

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                   
                    itemCount: (widget.product_name['sizes']as List<int>).length,
                    
                    itemBuilder: 
                  (context,index)
                  {
                    final size = (widget.product_name['sizes']as List<int>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            
                          size_selected = size;
                          });
                        },
                        child: Chip(
                          label: Text(size.toString()),
                          backgroundColor:
                           size_selected == size ? Theme.of(context).colorScheme.primary : null,
                        ),
                      ),
                    
                    );
                  },
                  ),
                ),
              ],
            ),
           ),
           Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                    
                    onPressed: (){}, 
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                      SizedBox(width: 6,),
                      Text('Add To Cart',
                      style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(80, 50),
                    elevation: 6
                  ),
                  ),
                )
          ],
        ),
    );
  }
}