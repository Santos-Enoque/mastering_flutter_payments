import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastering_payments/models/user.dart';

class UserService{
  String collection = "users";
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).setData(values);
  }

  void updateDetails(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).updateData(values);
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).document(id).get().then((doc){
        return UserModel.fromSnapshot(doc);
      });
}