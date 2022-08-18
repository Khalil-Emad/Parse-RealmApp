import 'package:flutter/material.dart';

import '../../models/slaveUser.dart';

class userCard extends StatelessWidget {
  final SlaveUser user;
  const userCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size.width * .36,
          height: size.height * .21,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.orange,
                ),
                height: size.height * .1,
                width: size.width * .8,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      height: 5,
                    ),
                    Text(
                      user.name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "Total Spending",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    height: 50,
                  ),
                  RotatedBox(
                      quarterTurns: 3,
                      child: new Text(
                        "EGP",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Text(
                    user.amount!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                height: 10,
              ),
              Text(
                "Last Spend ${user.date}",
                style: TextStyle(fontSize: 8, color: Colors.grey),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: .0,
          right: .0,
          child: Container(
              width: size.width * .1,
              height: size.height * .08,
              child: Image(
                image: AssetImage("assets/images/man.png"),
              )),
        )
      ],
    );
  }
}
