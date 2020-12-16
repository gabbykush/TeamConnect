import 'package:flutter/material.dart';
import 'package:flutterapp222/pages/restaurant.dart';
import 'package:flutterapp222/pages/paymentoption.dart';

//import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
//import 'package:flutter_ui_challenges/core/presentation/res/colors.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class FoodCheckoutOnePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 80,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              kToolbarHeight + 40.0,
              16.0,
              16.0,
            ),
            children: [
              Text(
                "My Order",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              OrderListItem(
                item: OrderItem(
                  title: "Deluxe Hamburger",
                  qty: 2,
                  price: 12,
                  bgColor: Colors.deepOrange,
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/1200px-RedDot_Burger.jpg',
                ),
              ),
              const SizedBox(height: 20.0),
              OrderListItem(
                item: OrderItem(
                    title: "Chicken Sandwich",
                    qty: 1,
                    price: 15,
                    bgColor: Colors.deepOrange,
                    image:
                        'https://www.cfacdn.com/img/order/menu/Online/Entrees/Jul19_CFASandwich_pdp.png'),
              ),
              const SizedBox(height: 20.0),
              OrderListItem(
                item: OrderItem(
                    title: "Chocolate Milkshake",
                    qty: 1,
                    price: 8.00,
                    bgColor: Colors.deepOrange,
                    image:
                        'https://d1fd34dzzl09j.cloudfront.net/Images/CFACOM/Stories%20Images/2019/10/top%205%20treats/chocmilkshake.jpg'),
              ),
              const SizedBox(height: 20.0),
              _buildDivider(),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "Tax",
                    style: priceTextStyle,
                  ),
                  Spacer(),
                  Text(
                    "\$2",
                    style: priceTextStyle,
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              const SizedBox(height: 20.0),
              _buildDivider(),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "Total",
                    style: priceTextStyle.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    "\$49",
                    style: priceTextStyle.copyWith(color: Colors.indigo),
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              const SizedBox(height: 10.0),
              GestureDetector(onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Payment()));
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
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

class OrderItem {
  final String title;
  int qty;
  final double price;
  final String image;
  final Color bgColor;
  OrderItem({this.title, this.qty, this.price, this.image, this.bgColor});
}

class OrderListItem extends StatelessWidget {
  final OrderItem item;

  const OrderListItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: item.bgColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: item.image != null
                ? Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text(
                        "${item.qty}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.add),
                        onPressed: () {
                          item.qty++;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            "\$${item.price * item.qty}",
            style: priceTextStyle,
          ),
        ],
      ),
    );
  }
}
