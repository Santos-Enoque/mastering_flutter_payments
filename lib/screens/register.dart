import 'package:flutter/material.dart';
import 'package:mastering_payments/provider/user_provider.dart';
import 'package:mastering_payments/services/functions.dart';
import 'package:mastering_payments/services/styles.dart';
import 'package:mastering_payments/widgets/custom_text.dart';
import 'package:mastering_payments/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login1.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      body:user.status == Status.Authenticating? Loading() : Container(
        color: white,
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset("images/credit.png", width: 200, height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomText(msg: "Hey There!", size: 36, weight: FontWeight.bold,),
                  ),
                ],
              ),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(msg: "Create your new account!", size: 22, weight: FontWeight.w600, color: grey,),
            ],
          ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: user.name,
                  decoration: InputDecoration(
                    hintText: 'Username',
                      hintStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: user.email,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                      hintStyle: TextStyle(fontSize: 20)

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      controller: user.password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 20)
                      ),
                    ),

                    Positioned(
                        top: 13,
                        right: 20,
                        child: CustomText(msg: "Forgot?", color: blue,))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: green
                  ),
                  child: GestureDetector(
                    onTap: ()async{
                      if(!await user.signUp()){
                        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Sign up failed")));
                        return;
                      }
                      user.clearController();
                      changeScreenReplacement(context, HomeScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: CustomText(msg: "REGISTER", color: white, size: 24, weight: FontWeight.w600,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      changeScreen(context, LoginOne());

                    },
                    child: CustomText(msg: "if you have an account click here to login!", size: 18, weight: FontWeight.bold, color: grey,)),
                ],
              ),



            ],

          ),
        ),
      ),
    );
  }
}