import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
import 'package:teamconnect/general/resources/dimension.dart';

class FoodTabPage extends StatefulWidget {
  @override
  _FoodTabPageState createState() => _FoodTabPageState();
}

class _FoodTabPageState extends State<FoodTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationConnect(index: 2),
        body:SingleChildScrollView(
              child: Column(
          children: [

            //chick-fil-a
            Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              height: 250,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      restIcon(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      restName(),
                                      Spacer(),
                                      //phoneNumber(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      //phoneIcon(),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: <Widget>[
                                      locationAddress(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      openRest(),
                                      Spacer(),
                                      phoneIcon(),
                                      phoneNumber(),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
                    
                    
                 //   Mcdonalds
                    Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              height: 250,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      restIcon2(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      restName2(),
                                      Spacer(),
                                      //phoneNumber(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      //phoneIcon(),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: <Widget>[
                                      locationAddress2(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      openRest2(),
                                      Spacer(),
                                      phoneIcon2(),
                                      phoneNumber2(),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),         
            
            
            
            
            //hells kitchken
             Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              height: 250,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      restIcon3(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      restName3(),
                                      Spacer(),
                                      //phoneNumber(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      //phoneIcon(),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: <Widget>[
                                      locationAddress3(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      openRest3(),
                                      Spacer(),
                                      phoneIcon3(),
                                      phoneNumber3(),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),],
        ),
      ),





      
    ));
  }

  Widget restIcon() {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.restaurant,
              size: 40,
            )));
  }

  Widget restName() {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: "Chick-Fil-A",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: "\nfast food",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "123-456-7890",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n2 Miles away',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget phoneIcon() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Icon(
          Icons.phone,
          color: Colors.green,
          size: 30,
        ));
  }

  Widget locationAddress() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "\n250 West 55th St",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget openRest() {
    return Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>FoodTabPage()));
          },
          color: Colors.white,
          child: Text(
            "Open",
          ),
          
        )
        );
  }
}

//2nd one
Widget restIcon2() {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.restaurant,
              size: 40,
            )));
  }

  Widget restName2() {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: "McDonalds",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: "\nfast food",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget phoneNumber2() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "111-222-3333",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n45 Miles away',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget phoneIcon2() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Icon(
          Icons.phone,
          color: Colors.green,
          size: 30,
        ));
  }

  Widget locationAddress2() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "\n17-69 45th street",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget openRest2() {
    return Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          color: Colors.black,
          child: Text(
            "Open",
          ),
          onPressed: null,
        ));
  }




//#3



Widget restIcon3() {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.restaurant,
              size: 40,
            )));
  }

  Widget restName3() {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: "Hell's Kitchen",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: "\nfancy",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget phoneNumber3() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "321-654-1234",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n7.5 Miles away',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget phoneIcon3() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Icon(
          Icons.phone,
          color: Colors.green,
          size: 30,
        ));
  }

  Widget locationAddress3() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "\n douglas street",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget openRest3() {
    return Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          color: Colors.black,
          child: Text(
            "Open",
          ),
          onPressed: null,
        ));
  }

