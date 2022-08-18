import 'package:flutter/material.dart';
import '../../models/slaveUser.dart';
import 'userCard.dart';

class users extends StatelessWidget {
  final usersList;
  const users({Key? key,required this.usersList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        width: size.width,
        height: size.height * .3,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            SlaveUser user = usersList[i];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: userCard(user:user),
            );
          },
        ),
      ),
    );
  }
}
