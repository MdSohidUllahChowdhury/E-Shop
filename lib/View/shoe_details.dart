import 'package:e_commerce_app/Controller/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int sizeSelected = 0; //* <--

//!------------->>>>>>
  void onTap() {
    if (sizeSelected != 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': sizeSelected
      });

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Added To The Cart')));
    } else {
      (ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Hey! Select Size!!!'))));
    }
  }
//!---------------<<<<<<<<<

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.product['title'] as String,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Image.asset(widget.product['imageUrl'] as String),
          const SizedBox(
            height: 25,
          ),
          Text(
            '\$${widget.product['price']}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (widget.product['sizes'] as List<int>).length,
              itemBuilder: (context, index) {
                final size = (widget.product['sizes'] as List<int>)[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeSelected = size;
                      });
                    },
                    child: Chip(
                      label: Text(size.toString()),
                      backgroundColor: sizeSelected == size
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(80, 50),
                  elevation: 6),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
