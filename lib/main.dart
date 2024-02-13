import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/cart_provider.dart';
import 'package:shop_flutter/home_page_dart.dart';
import 'package:shop_flutter/product_details_page.dart';
import 'package:shop_flutter/shoesList_variable.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider(),),
        Provider<String>(create: (context) =>  'stringProvider',),

      ],
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow,primary: Colors.yellow),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            prefixIconColor: Color.fromRGBO(199, 199, 199, 1),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
            useMaterial3: true
        ),

        home: const HomePage(),
      ),
    );
  }

}