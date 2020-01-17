import 'package:flutter/material.dart';
import 'package:mastering_payments/provider/payment_provider.dart';
import 'package:mastering_payments/provider/user_provider.dart';
import 'package:mastering_payments/screens/login1.dart';
import 'package:mastering_payments/screens/products.dart';
import 'package:mastering_payments/services/functions.dart';
import 'package:mastering_payments/services/styles.dart';
import 'package:mastering_payments/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import 'credit_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
          "Flutter Payments",
          style: TextStyle(color: Colors.green),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: CustomText(
                msg: "Santos@enoque.com",
                color: white,
              ),
              accountName: CustomText(
                msg: "Santos Enoque",
                color: white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: CustomText(
                msg: "Manage Cards",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: CustomText(
                msg: "Purchase history",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: CustomText(
                msg: "Log out",
              ),
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginOne());
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "images/mobile.png",
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(color: green),
                  child: GestureDetector(
                    onTap: () async {
                          changeScreen(context, CreditCard(title: "Add card",));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: CustomText(
                            msg: "Add Credit Card",
                            color: white,
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(color: green),
                  child: GestureDetector(
                    onTap: () {
                      changeScreen(context, ProductsScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: CustomText(
                            msg: "Buy Products",
                            color: white,
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(color: green),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: CustomText(
                            msg: "Subscriptions",
                            color: white,
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
