import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamconnect/Widgets/bottom_nav_bar.dart';
import 'package:teamconnect/general/resources/dimension.dart';
import 'package:flutterapp222/pages/foodMenu.dart';

//Main Food Page/Starting point


class FoodTabPage extends StatefulWidget {
  @override
  _FoodTabPageState createState() => _FoodTabPageState();
}

class _FoodTabPageState extends State<FoodTabPage> {
@override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Nearby Resteraunts"),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.filter_list),
          )
        ],
      ),
      body: Lists(),
    );
  }
}

class Item {
  final String title;
  final String catagory;
  final String place;
  final String ratings;
  final String discount;
  final String image;

  Item(
      {this.title,
      this.catagory,
      this.place,
      this.ratings,
      this.discount,
      this.image});
}

class Lists extends StatelessWidget {
  final List<Item> _data = [
    Item(
        title: 'Chick-Fil-A',
        catagory: "Fast Food",
        place: "250 West Street",
        ratings: "5.0/80",
        discount: "10%",
        image:
            "https://www.charlotteobserver.com/latest-news/ns6kaa/picture244529987/alternates/FREE_1140/chick-fil-a.jpg"),
    Item(
        title: 'Mcdonalds',
        catagory: "Fast Food",
        place: "31-67 Steinway St",
        ratings: "4.5/90",
        discount: null,
        image:
            "https://upload.wikimedia.org/wikipedia/commons/4/4b/McDonald%27s_logo.svg"),
    Item(
        title: 'Starbucks',
        catagory: "Coffee Shop",
        place: "31-01 Broadway",
        ratings: "4.5/90",
        discount: "2 %",
        image:
            "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png"),
    Item(
        title: 'Dunkin',
        catagory: "Coffee Shop",
        place: "1104 Lexington Ave",
        ratings: "4.5/90",
        discount: null,
        image:
            "https://prnewswire2-a.akamaihd.net/p/1893751/sp/189375100/thumbnail/entry_id/1_na94j69v/def_height/733/def_width/1400/version/100011/type/2/q/100"),
    Item(
        title: 'Hells Kitchen',
        catagory: "Fancy",
        place: "754 9th Ave",
        ratings: "4.5/90",
        discount: null,
        image:
            "https://example2178.files.wordpress.com/2016/01/hk01.jpg?w=326&h=179"),

          Item(
        title: 'Burger King',
        catagory: "Fast Food",
        place: "327 W 42nd Street",
        ratings: "4.5/90",
        discount: null,
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Burger_King_logo.svg/1200px-Burger_King_logo.svg.png"),

            Item(
        title: 'Wendys',
        catagory: "Fast Food",
        place: "938 8th Ave",
        ratings: "4.5/90",
        discount: "12 %",
        image:
            "https://img.foodlogistics.com/files/base/acbm/fl/image/2015/08/wendys_co_logo.55d5ec69667bb.png?auto=format&fit=max&w=1200"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        Item item = _data[index];
        return Card(
          elevation: 3,
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 110,
                padding:
                    EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item.image), fit: BoxFit.cover)),
                child: item.discount == null
                    ? Container()
                    : Container(
                        color: Colors.deepOrange,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              item.discount,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Discount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodMenu()));
                  },
                  child: Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                    Text(
                      item.catagory,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      item.place,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.pink,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.pink,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.pink,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.pink,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.pink,
                          size: 18,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          item.ratings,
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ratings",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
