import 'package:flutter/material.dart';
import 'package:mastering_payments/models/products.dart';
import 'package:mastering_payments/services/products.dart';

class ProductsProvider with ChangeNotifier{
  List<Products> productsList = [];
  ProductsServices _productsServices = ProductsServices();

  ProductsProvider(){
    loadProducts();
  }
  Future loadProducts()async{
    productsList = await _productsServices.getProducts();
    notifyListeners();
  }
}