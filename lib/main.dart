import 'package:flutter/material.dart';
import 'package:mastering_payments/provider/payment_provider.dart';
import 'package:mastering_payments/provider/user_provider.dart';
import 'package:mastering_payments/screens/home.dart';
import 'package:mastering_payments/screens/login1.dart';
import 'package:mastering_payments/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: PaymentProvider.initialize())
  ] ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.green
        ),
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginOne();
      case Status.Authenticated:
        return HomeScreen();
      default: return LoginOne();
    }
  }
}

// LETS KEEP THE SPLASH SCREEN HERE FOR NOW




