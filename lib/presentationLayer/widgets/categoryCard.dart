import 'package:flutter/material.dart';

class categoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final String price;
  final String text;
  final Color color;
  const categoryCard({Key? key, required this.title, required this.icon, required this.price, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .4,
      height: size.height * .19,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: color,
            ),
            height: size.height * .05,
            width: size.width * .8,
            child: Center(
                child: Text(
              title,
              style: TextStyle(color: Colors.white),
            )),
          ),
          Container(
              width: size.width * .2,
              height: size.height * .05,
              child: Image.asset("assets/images/${icon}.png")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                  quarterTurns: 3,
                  child: new Text(
                    "EGP",
                    style: TextStyle(color: Colors.grey),
                  )),
              Text(
              price,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(
            height: 10,
          ),
          Text(
           text,
            style: TextStyle(fontSize: 8, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
