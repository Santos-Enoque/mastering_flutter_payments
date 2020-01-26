import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastering_payments/models/cards.dart';
import 'package:mastering_payments/models/user.dart';

class CardServices{
  static const CUSTOMER_ID = 'customerId';

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

  Future<List<CardModel>> getPurchaseHistory({String customerId})async =>
      _firestore.collection(collection).where(CUSTOMER_ID, isEqualTo: customerId).getDocuments().then((result){
        List<CardModel> listOfCards = [];
        result.documents.map((item){
          listOfCards.add(CardModel.fromSnapshot(item));
        });
        return listOfCards;
      });
}