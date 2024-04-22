import 'package:e_commerce_app/global_call.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}



class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
       Text('Cart Items',
       style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25),
        ),
        centerTitle: true,
        ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: cart.length ,
              itemBuilder:(context,index){
                final cartItems = cart[index];
                
                return ListTile(
                  leading: Container(
                    height: 80,width: 70,
                    child: Image(image: AssetImage(cartItems['imageUrl']as String)),
                  ),

                  title: Text(cartItems['title'].toString(),
                  style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold),),

                  subtitle: Text('Size: ${cartItems['sizes']}',style: TextStyle(
                    fontSize: 12,fontWeight: FontWeight.bold),),

                  trailing: IconButton(onPressed: (){}, 
                  icon:Icon(Icons.delete,size: 25,color: Colors.red,))
                  
                );
              }
              ),
          )
        ],
      ),
    );
  }
}