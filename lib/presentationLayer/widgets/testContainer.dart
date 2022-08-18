import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  const TestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .85,
      height: size.height * .12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color.fromARGB(255, 76, 163, 233),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Test", style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(width: size.width * .34),
            Icon(Icons.arrow_forward_ios, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
