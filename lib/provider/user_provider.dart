import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mastering_payments/models/cards.dart';
import 'package:mastering_payments/models/purchase.dart';
import 'package:mastering_payments/models/user.dart';
import 'package:mastering_payments/services/cards.dart';
import 'package:mastering_payments/services/purchases.dart';
import 'package:mastering_payments/services/user.dart';

enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get user => _user;
  Firestore _firestore = Firestore.instance;
  UserService _userService = UserService();
  CardServices _cardServices  = CardServices();
  PurchaseServices _purchaseServices = PurchaseServices();

  UserModel _userModel;
  List<CardModel> cards = [];
  List<PurchaseModel> purchaseHistory = [];


//  we will make this variables public for now
  final formKey = GlobalKey<FormState>();
//  getter
  UserModel get userModel => _userModel;
  bool hasStripeId = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();


  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  void hasCard(){
    hasStripeId = !hasStripeId;
    notifyListeners();
}

Future<void> loadCardsAndPurchase({String userId})async{
    cards = await _cardServices.getCards(userId: userId);
    purchaseHistory = await _purchaseServices.getPurchaseHistory(userId: userId);
  }

  Future<bool> signUp()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result){
        _firestore.collection('users').document(result.user.uid).setData({
          'name':name.text,
          'email':email.text,
          'uid':result.user.uid
        });
      });
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut()async{
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController(){
    name.text = "";
    password.text = "";
    email.text = "";
  }


  Future<void> _onStateChanged(FirebaseUser user) async{
    if(user == null){
      _status = Status.Unauthenticated;
    }else{
      _user = user;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(user.uid);
      cards = await _cardServices.getCards(userId: user.uid);
      purchaseHistory = await _purchaseServices.getPurchaseHistory(userId: user.uid);
      if(_userModel.stripeId == null){
        hasStripeId = false;
        notifyListeners();
      }
      print(_userModel.name);
      print(_userModel.email);
      print(_userModel.stripeId);

    }
    notifyListeners();
  }
}