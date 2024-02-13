import 'package:flutter/material.dart';

class Product_Card extends StatelessWidget{
  final String title;
  final double price;
  final String image;
  final Color backgroundcolor;

  const Product_Card({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundcolor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 5,),
            Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
            Center(child: Image(image: AssetImage(image),height: 175,)),

          ],
        ),
      )
    );
  }
}