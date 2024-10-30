import 'package:e_commerce_app/Controller/product_list.dart';
import 'package:e_commerce_app/View/shoe_details.dart';
import 'package:e_commerce_app/Widgets/shoe_card.dart';
import 'package:flutter/material.dart';

class Utils {
  static customBar() {
    return const Row(
      children: [
        Text(
          ' Shoes \n Collection',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                )),
          ),
        )
      ],
    );
  }

  static shoesDisplay() {
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DetailsPage(product: product);
                }));
              },
              child: ShowCard(
                  title: product['title'] as String,
                  price: product['price'] as double,
                  image: product['imageUrl'] as String,
                  bgcolor: index.isEven
                      ? const Color.fromRGBO(216, 240, 253, 1)
                      : const Color.fromRGBO(245, 247, 249, 1)),
            );
          }),
    );
  }
}
