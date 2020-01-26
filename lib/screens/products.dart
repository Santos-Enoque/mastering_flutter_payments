import 'package:flutter/material.dart';
import 'package:mastering_payments/models/product.dart';
import 'package:mastering_payments/provider/user_provider.dart';
import 'package:mastering_payments/screens/login1.dart';
import 'package:mastering_payments/services/functions.dart';
import 'package:mastering_payments/services/styles.dart';
import 'package:mastering_payments/widgets/custom_text.dart';
import 'package:mastering_payments/widgets/product_card.dart';
import 'package:provider/provider.dart';

// static product list
List<Product> productsList = [
  Product("Flutter", 7.05, 'flutter.png'),
  Product("Python", 12.00, 'python.jpg'),
  Product("Dart", 0.99, 'dart.png'),
  Product("Java", 1.99, 'java.png'),
];

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Products",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Container(
        color: white,
        child: Container(
          child: ListView.builder(
            itemCount: productsList.length,
              itemBuilder: (_, index){
            return ProductCard(image: productsList[index].image,name: productsList[index].name, price: productsList[index].price);
          })
        ),
      ),
    );
  }
}
