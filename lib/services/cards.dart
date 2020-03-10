import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastering_payments/models/cards.dart';
import 'package:mastering_payments/models/user.dart';

class CardServices{
  static const CUSTOMER_ID = 'customerId';

  String collection = "cards";
  Firestore _firestore = Firestore.instance;

  void createCard({String id, String userId, int exp_month, int exp_year, int last4}){
    _firestore.collection(collection).document(id).setData({
      "id": id,
      "userId": userId,
      "exp_month": exp_month,
      "exp_year":exp_year,
      "last4": last4
    });
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