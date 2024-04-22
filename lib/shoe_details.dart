import 'package:e_commerce_app/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details_Page extends StatefulWidget {



  final Map<String,Object> product;
   Details_Page({
    super.key, required this.product
    });
  
  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  int size_selected = 0;
 
 void onTap (){
  if (size_selected != 0){
  Provider.of<CartProvider>(context,listen: false).addToCart(
    {
  
   'id': widget.product['id'],
    'title': widget.product['title'],
    'price': widget.product['price'],
    'imageUrl': widget.product['imageUrl'],
    'company':widget.product ['company'],
    'sizes': size_selected
  
  }
  
  );ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Successfully Added To The Cart')));
  }else(
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hey! Select Size!!!')))
  );
 }

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
              child: Text(widget.product['title']as String,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                    ),    
            ),

            //Spacer(),
            Image.asset(widget.product['imageUrl'] as String),
            //Spacer(),

           // Text(product_name['price'] as dynamic)

           Container(
            height: 100,
            child: Column(
              children: [
                Text('\$${widget.product['price']}',style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                    ),
                SizedBox(height: 10,),

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                   
                    itemCount: (widget.product['sizes']as List<int>).length,
                    
                    itemBuilder: 
                  (context,index)
                  {
                    final size = (widget.product['sizes']as List<int>)[index];
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
                    
                    onPressed: onTap, 
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