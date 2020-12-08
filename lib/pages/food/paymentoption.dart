import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp222/pages/creditcard.dart';
import 'package:flutterapp222/pages/orderpage2.dart';
import 'package:flutterapp222/pages/restaurant.dart';
import 'package:flutterapp222/pages/cash.dart';

class Payment extends StatelessWidget {
  //pay Cash or Credit option page

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
      body: Column(
        children: [
          Container(child: Text("Select Payment Option", style: TextStyle(fontSize: 38),)),
          GestureDetector(onDoubleTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cash()));
                      },
                                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                      child: RaisedButton(
                        padding: const EdgeInsets.all(16.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.yellow.shade700,
                        child: Text(
                          "Cash",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),


                  GestureDetector(onDoubleTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Credit()));
                      },
                                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                      child: RaisedButton(
                        padding: const EdgeInsets.all(16.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.yellow.shade700,
                        child: Text(
                          "Credit/Debit",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}