import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedsize =0;
  void ontap(){
    if(selectedsize != 0 ){
      Provider.of<CartProvider>(context,listen: false).addproduct(
          {
            'id' : widget.product['id'],
            'title' : widget.product['title'],
            'price' : widget.product['price'],
            'imageurl' : widget.product['imageurl'],
            'company' : widget.product['company'],
            'size' : selectedsize
          }
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added'))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please Select a size'))
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    // final f = Network
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(widget.product['imageurl'].toString())),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = (widget.product['sizes'] as List<int> )[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsize = size;
                              });
                            },
                            child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectedsize == size ? Theme.of(context).colorScheme.primary : null,
                            ),

                          ),
                        );
                      }),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: ontap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.maxFinite, 50),
                    ),
                    child: const Text("Add to cart",style: TextStyle(color: Colors.black,fontSize: 18),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
