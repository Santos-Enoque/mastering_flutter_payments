import 'package:flutter/material.dart';
import 'package:mastering_payments/models/purchase.dart';
import 'package:mastering_payments/services/styles.dart';
import 'package:mastering_payments/widgets/custom_text.dart';

class Purchases extends StatefulWidget {

  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
List<PurchaseModel> purchaseList = [
 PurchaseModel.fromMap({
  "id": "asdasdasd",
  "productName": "Flutter",
  "amount": 12,
  "date": "12 Jan 2019"
}),


  PurchaseModel.fromMap({
    "id": "asdasdasd",
    "productName": "Flutter",
    "amount": 12,
    "date": "12 Jan 2019"
  }),


  PurchaseModel.fromMap({
    "id": "asdasdasd",
    "productName": "Flutter",
    "amount": 12,
    "date": "12 Jan 2019"
  }),


  PurchaseModel.fromMap({
    "id": "asdasdasd",
    "productName": "Flutter",
    "amount": 12,
    "date": "12 Jan 2019"
  }),


  PurchaseModel.fromMap({
    "id": "asdasdasd",
    "productName": "Flutter",
    "amount": 12,
    "date": "12 Jan 2019"
  }),
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
          "Purchase History",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: ListView.separated(
        itemCount: purchaseList.length,
        itemBuilder: (_, index){
          return ListTile(
            leading: CustomText(msg: "\$" + purchaseList[index].amount.toString()),
            title: Text(purchaseList[index].productName),
            subtitle: Text("Order id: asdasdasdasd \n Putchased on: ${purchaseList[index].date}"),
            trailing: Icon(Icons.more_horiz),
            onTap: (){

            },
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider();
      },)
    );
  }
}
