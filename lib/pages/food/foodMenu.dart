import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp222/pages/orderpage2.dart';
import 'package:flutterapp222/pages/restaurant.dart';

//import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
//import 'package:teamconnect/general/resources/dimension.dart';



class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavigationConnect(index: 2),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.black,
                )),
            child: Center(child: Text('''
                          Chick-Fil-A
              
    250 West 55th Street Manhattan,NY
    
    718-922-5563''', style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Popular \n Items',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'View All',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodCheckoutOnePage()));
                  },
                  child: Container(
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/1200px-RedDot_Burger.jpg',
                      fit: BoxFit.cover,
                    ),
                    width: 160.0,
                    //color: Colors.red,
                  ),
                ),
                Container(
                  child: Image.network(
                    'https://www.cfacdn.com/img/order/menu/Online/Entrees/Jul19_CFASandwich_pdp.png',
                    fit: BoxFit.cover,
                  ),
                  width: 160.0,
                  //color: Colors.blue,
                ),
                Container(
                  child: Image.network(
                    'https://thechickenwire.chick-fil-a.com/-/media/amazon-cloudfront/images/cfacom/stories-images/2020/family-bundle/header.ashx',
                    fit: BoxFit.cover,
                  ),
                  width: 160.0,
                  color: Colors.green,
                ),
                Container(
                  child: Image.network(
                    'https://d1fd34dzzl09j.cloudfront.net/2020/June/MPTL_cover_image_copy_FINAL.jpg',
                    fit: BoxFit.cover,
                  ),
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  child: Image.network(
                    'https://d1fd34dzzl09j.cloudfront.net/Images/CFACOM/Stories%20Images/2019/10/top%205%20treats/chocmilkshake.jpg',
                    fit: BoxFit.cover,
                  ),
                  width: 160.0,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Text(
                  "Main food",
                  style: TextStyle(fontSize: 25),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        trailing: Text("9.95"),
                        title: Text('Deluxe Hamburger'),
                        subtitle: Text('Lettuce,Tomato,Pickles,Onions.'),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                          trailing: Text("6.95"),
                          title: Text('Chicken Sandwich'),
                          subtitle: Text('Lettuce,Tomato,Pickles,Onions.')),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        trailing: Text("5.00"),
                        title: Text('10 piece Chicken Nuggets'),
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                Text("desserts", style: TextStyle(fontSize: 25)),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        trailing: Text("9.95"),
                        title: Text('Deluxe Hamburger'),
                        subtitle: Text('Lettuce,Tomato,Pickles,Onions.'),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        trailing: Text("6.95"),
                        title: Text('Chicken Sandwich'),
                        subtitle: Text('Lettuce,Tomato,Pickles,Onions.'),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        trailing: Text("5.00"),
                        title: Text('10 piece Chicken Nuggets'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
