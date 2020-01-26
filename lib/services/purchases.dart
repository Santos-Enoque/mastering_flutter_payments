import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastering_payments/models/purchase.dart';
import 'package:mastering_payments/models/user.dart';

class PurchaseServices{
  String collection = "purchases";
  Firestore _firestore = Firestore.instance;

  void createPurchase(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).setData(values);
  }

//  void updateDetails(Map<String, dynamic> values){
//    _firestore.collection(collection).document(values["id"]).updateData(values);
//  }

//  Future

//  Future<UserModel> getPurchaseById(String id) =>
//      _firestore.collection(collection).document(id).get().then((doc){
//        return PurchaseModel.fromSnapshot(doc);
//      });
}