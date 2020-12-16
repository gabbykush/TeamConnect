import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutterapp222/pages/orderpage2.dart';
import 'package:flutterapp222/pages/restaurant.dart';

class Cash extends StatelessWidget {
  //static final String path = "lib/src/pages/lists/list1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash"),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.filter_list),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              child: Text(
            "You're all set! Present the amount due for the driver!",
            style: TextStyle(fontSize: 38),
          )),
          

        ],
      ),
    );
  }
}
