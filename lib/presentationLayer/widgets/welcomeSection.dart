import 'package:flutter/material.dart';

class welcomeSection extends StatelessWidget {
  final String userName;
  const welcomeSection({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            width: size.width * .2,
            height: size.height * .12,
            child: Image(
              image: AssetImage("assets/images/man.png"),
            )),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Evening,',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Text(
              userName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
