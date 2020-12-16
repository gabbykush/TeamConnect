import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutterapp222/pages/orderpage2.dart';
import 'package:flutterapp222/pages/restaurant.dart';

class Credit extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.filter_list),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: Text(
              "Enter Your Credit Card Information:",
              style: TextStyle(fontSize: 38),
            )),
            SizedBox(
              height: 50,
            ),
            CreditCardInputForm(
              cardHeight: 230,
              showResetButton: true,
              onStateChange: (currentState, cardInfo) {
                print(currentState);
                print(cardInfo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
