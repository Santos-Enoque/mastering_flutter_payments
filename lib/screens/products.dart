import 'package:flutter/material.dart';
import 'package:mastering_payments/provider/products_provider.dart';
import 'package:mastering_payments/provider/user_provider.dart';
import 'package:mastering_payments/services/styles.dart';
import 'package:mastering_payments/widgets/product_card.dart';
import 'package:provider/provider.dart';


class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final products = Provider.of<ProductsProvider>(context);

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
            itemCount: products.productsList.length,
              itemBuilder: (_, index){

            return ProductCard(image: products.productsList[index].image,name: products.productsList[index].name, price: products.productsList[index].price);
          })
        ),
      ),
    );
  }
}
