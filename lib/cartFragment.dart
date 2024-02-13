import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/shoesList_variable.dart';

import 'cart_provider.dart';

class cartFragment extends StatelessWidget {
  const cartFragment({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartProvider>().cart;
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(

          title: Text('Cart'),
        ),
        body: ListView.builder(
          itemCount: value.cart.length,
            itemBuilder: (context, index) {
              final cartitem = value.cart[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartitem['imageurl'].toString()),
                  radius: 30,
                ),
                title: Text(cartitem['title'].toString(),style: Theme.of(context).textTheme.bodySmall,),
                subtitle: Text(cartitem['size'].toString()),
                trailing: IconButton(
                    onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text('Delete Product',style: Theme.of(context).textTheme.titleMedium,),
                              content: const Text('Are you sure you want to removethe product from you cart?'),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Text('No',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                                TextButton(onPressed: () {
                                    value.removeProduct(cartitem);
                                }, child: Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
                              ],
                            );
                          }
                      );
                    },
                    icon:const Icon(Icons.delete,color: Colors.red,)
                ),
              );
            },
        ),
      ),
    );
  }
}
