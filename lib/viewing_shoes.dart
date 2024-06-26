import 'package:flutter/cupertino.dart';

class Show_Card extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color  bgcolor;
  
  const Show_Card({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgcolor,
    });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
     
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
         color: bgcolor, 
         borderRadius: BorderRadius.circular(20)
      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                        ),
                      SizedBox(height: 6,),
                      Text('\$$price',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold)
                        ),
                      SizedBox(height: 6,),
                      Center(
                        child: Image(
                          //fit: BoxFit.cover,
                          image: AssetImage(image), 
                          height: 240,
                          width: double.infinity,
                          ),
                      )
                    ],
                  ),
                 );
  }
}