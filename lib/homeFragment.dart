import 'package:flutter/material.dart';
import 'package:shop_flutter/product_cart.dart';
import 'package:shop_flutter/product_details_page.dart';
import 'package:shop_flutter/shoesList_variable.dart';

class homeFragment extends StatefulWidget {
  const homeFragment({super.key});

  @override
  State<homeFragment> createState() => _homeFragmentState();
}

class _homeFragmentState extends State<homeFragment> {


  @override
  Widget build(BuildContext context) {
    String selectedFilter = 'All';
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(107, 107, 107, 1.0),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    final List<String> filters = ['All', 'Addidas', 'Nike', 'Bata'];
    @override
    void initState() {
      super.initState();
      selectedFilter = filters[0];
    }
    return  SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                          side: const BorderSide(
                              color: Color.fromRGBO(107, 107, 107, 1.0)),
                          label: Text(filter),
                          labelStyle: const TextStyle(fontSize: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                final Product = product[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProductDetailsPage(product: product[index]);
                      }),
                    );
                  },
                  child: Product_Card(
                    title: Product['title'].toString(),
                    price: 33.55,
                    image: Product['imageurl'].toString(),
                    backgroundcolor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 229, 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
