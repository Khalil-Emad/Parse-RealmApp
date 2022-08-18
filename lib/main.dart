import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models/Parse.dart';
import 'presentationLayer/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await ParseModel.initParse();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Systel Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          platform: TargetPlatform.iOS,
        ),
        // home: Home());
        home: Login());
  }
}
