import 'package:flutter/material.dart';
import 'package:shop_flutter/homeFragment.dart';
import 'package:shop_flutter/product_cart.dart';
import 'package:shop_flutter/product_details_page.dart';
import 'package:shop_flutter/shoesList_variable.dart';

import 'cartFragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      homeFragment(),
      cartFragment(),
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 35,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            currentIndex: currentpage,
            onTap: (value) {
              setState(() {
                currentpage = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "cart"),
            ]),

        body: IndexedStack(
          index: currentpage,
          children: pages,
        ));
  }
}
