import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentProvider with ChangeNotifier{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  PaymentMethod _paymentMethod = PaymentMethod();

  PaymentProvider.initialize(){
    StripePayment.setOptions(
        StripeOptions(publishableKey: "pk_test_A4nXLMSuUFOORBC9PE1x0TmK00Flkotazb")
    );
  }

  void addCard(){
    StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest()).then((paymentMethod){
      _paymentMethod = paymentMethod;
    }).catchError((err){
      print("There was an error: ${err.toString()}");
    });
  }
}