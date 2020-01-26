import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:mastering_payments/models/cards.dart';
import 'package:mastering_payments/screens/credit_card.dart';
import 'package:mastering_payments/services/styles.dart';

class ManagaCardsScreen extends StatefulWidget {
  @override
  _ManagaCardsScreenState createState() => _ManagaCardsScreenState();
}

class _ManagaCardsScreenState extends State<ManagaCardsScreen> {
  List<CardModel> cardsList = [
  CardModel.fromMap({
  'id': "asdasdas",
  'exp_month': 12,
  'exp_year':21,
  'last4': 4242,
  }, customerId: 'asdasdasdas'),
  CardModel.fromMap({
  'id': "asdasdas",
  'exp_month': 12,
  'exp_year':21,
  'last4': 2343,
  }, customerId: 'asdasdasdas'),
  CardModel.fromMap({
  'id': "asdasdas",
  'exp_month': 12,
  'exp_year':21,
  'last4': 3424,
  }, customerId: 'asdasdasdas'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Cards",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: ListView.builder(
          itemCount: cardsList.length,
          itemBuilder: (_, index){
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: grey[200],
                      offset: Offset(2, 1),
                      blurRadius: 5
                  )
                ]
            ),
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("**** **** **** ${cardsList[index].last4}"),
              subtitle: Text("${cardsList[index].month} / ${cardsList[index].year}"),
              trailing: Icon(Icons.more_horiz),
              onTap: (){

              },
            ),
          ),
        );

      })
    );
  }
}
