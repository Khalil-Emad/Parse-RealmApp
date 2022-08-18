import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:realm/realm.dart';
import '../../models/loggedUser.dart';
import '../../models/slaveUser.dart';
import '../widgets/testContainer.dart';
import '../widgets/users.dart';
import '../widgets/categoryCard.dart';
import '../widgets/welcomeSection.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Realm realm;
  _HomeState() {
    final config = Configuration.local([SlaveUser.schema, LoggedUser.schema]);
    realm = Realm(config);
  }
  var usersList;
  var loggedUserData;
  String userName = "";
  LoggedUser? loggedUser;

  getUserName() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    setState(() {
    userName = currentUser!.username!;
    });
  }

  addUsers() {
    var user1 = SlaveUser(
        name: "Emad",
        amount: "300.0",
        date: DateFormat("yyyy-MM").format(DateTime.now()).toString());
    var user2 = SlaveUser(
        name: "Ali",
        amount: "150.0",
        date: DateFormat("yyyy-MM")
            .format(DateTime.now().add(const Duration(days: 60)))
            .toString());
    var user3 = SlaveUser(
        name: "Osama",
        amount: "400.0",
        date: DateFormat("yyyy-MM")
            .format(DateTime.now().add(const Duration(days: 120)))
            .toString());
    setState(() {
      realm.write(() {
        realm.add(user1);
        realm.add(user2);
        realm.add(user3);
      });
    });
  }

  getUsers() {
    usersList = realm.all<SlaveUser>();
  }

  setLoggedUserData() {
    var loggrdUser = LoggedUser(
        walletAmount: "675",
        walletTransactionDate: DateFormat("yyyy-MM")
            .format(DateTime.now().add(const Duration(days: 180))),
        activityAmount: "193",
        activityTransactionDate: DateFormat("yyyy-MM")
            .format(DateTime.now().add(const Duration(days: 240))));
    setState(() {
      realm.write(() {
        realm.add(loggrdUser);
      });
    });
  }

  getLoggedUserData() {
    loggedUserData = realm.all<LoggedUser>();
    setState(() {
      loggedUser = loggedUserData[0];
    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
    addUsers();
    getUsers();
    setLoggedUserData();
    getLoggedUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/homebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                Divider(
                  height: 30,
                ),
                welcomeSection(
                  userName: userName,
                ),
                Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    categoryCard(
                      icon: 'wallet',
                      price: loggedUser!.walletAmount!,
                      text: 'Last update ${loggedUser!.walletTransactionDate!}',
                      title: 'YOUR WALLET',
                      color: Color.fromARGB(255, 59, 58, 58).withOpacity(0.5),
                    ),
                    categoryCard(
                      icon: 'hand',
                      price: loggedUser!.activityAmount!,
                      text:
                          'Transaction on ${loggedUser!.activityTransactionDate!}',
                      title: 'LAST ACTIVITY',
                      color:
                          Color.fromARGB(255, 146, 140, 140).withOpacity(0.5),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  child: TestContainer(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Users",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                users(
                  usersList: usersList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
