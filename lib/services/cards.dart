import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastering_payments/models/cards.dart';
import 'package:mastering_payments/models/user.dart';

class CardServices{
  String collection = "cards";
  Firestore _firestore = Firestore.instance;

  void createCard(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).setData(values);
  }

  void updateDetails(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).updateData(values);
  }

  void deleteCard(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).delete();
  }

  void getAllCards(String customerId){
    _firestore.collection(collection).document(customerId).delete();
  }



  Future<CreditCardModel> getCardById(String id) =>
      _firestore.collection(collection).document(id).get().then((doc){
        return CreditCardModel.fromSnapshot(doc);
      });
}