import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:mastering_payments/models/cards.dart';
import 'package:mastering_payments/provider/user_provider.dart';
import 'package:mastering_payments/screens/credit_card.dart';
import 'package:mastering_payments/services/styles.dart';
import 'package:provider/provider.dart';

class ManagaCardsScreen extends StatefulWidget {
  @override
  _ManagaCardsScreenState createState() => _ManagaCardsScreenState();
}

class _ManagaCardsScreenState extends State<ManagaCardsScreen> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

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
          itemCount: user.cards.length,
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
              title: Text("**** **** **** ${user.cards[index].last4}"),
              subtitle: Text("${user.cards[index].month} / ${user.cards[index].year}"),
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
