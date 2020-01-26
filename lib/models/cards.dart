import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel{
  static const ID = 'id';
  static const CUSTOMER_ID = 'customerId';
  static const MONTH = 'exp_month';
  static const YEAR = 'exp_year';
  static const LAST_FOUR = 'last4';

  String _id;
  String _customerId;
  int _month;
  int _year;
  int _last4;

//  getters
  String get id => _id;
  String get customerId => _customerId;
  int get month => _month;
  int get year => _year;
  int get last4 => _last4;

  CardModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _customerId = snapshot.data[CUSTOMER_ID];
    _month = snapshot.data[MONTH];
    _year = snapshot.data[YEAR];
    _last4 = snapshot.data[LAST_FOUR];
  }

  CardModel.fromMap(Map data, {String customerId}){
    _id = data[ID];
    _customerId = customerId;
    _month = data[MONTH];
    _year = data[YEAR];
    _last4 = data[LAST_FOUR];
  }

  Map<String, dynamic> toMap(){
    return {
      ID: _id,
      CUSTOMER_ID: _customerId,
      MONTH: _month,
      YEAR: _year,
      LAST_FOUR: _last4
    };
  }

}