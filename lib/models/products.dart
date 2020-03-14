import 'package:cloud_firestore/cloud_firestore.dart';

class
Products{
  static const NAME = "name";
  static const PRICE = "price";
  static const IMAGE = "image";

   String _name;
   String _price;
   String _image;

//   getters

  String get name => _name;
  String get price => _price;
  String get image => _image;

  Products.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _price = snapshot.data[PRICE].toString();
    _image = snapshot.data[IMAGE];
  }

}