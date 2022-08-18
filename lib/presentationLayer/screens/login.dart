import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool error = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      error = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            error
                ? Container(
                    width: size.width * .6,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Error.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
            Divider(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              width: size.width * .9,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Username or Email",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: userNameCtrl,
                validator: RequiredValidator(errorText: 'Required'),
              ),
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: size.width * .9,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                obscureText: true,
                textAlign: TextAlign.center,
                controller: passCtrl,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey[400])),
                validator: RequiredValidator(errorText: 'Required'),
              ),
            ),
            Divider(
              height: size.height * .2,
            ),
            Container(
              width: size.width * .8,
              height: size.height * .06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () async {
                  final form = formKey.currentState!;
                  if (form.validate()) {
                    final user = ParseUser(
                        userNameCtrl.text.trim(),
                        passCtrl.text.trim(),
                        "${userNameCtrl.text.trim()}" + "@gmail.com");
                    var response = await user.signUp();
                    if (response.success) {
                      setState(() {
                        error = false;
                      });
                      Fluttertoast.showToast(
                          msg: "Registration Done",
                          toastLength: Toast.LENGTH_SHORT);
                      var logging = await user.login();
                      if (logging.success) {
                        Get.to(() => Home());
                      }
                    } else {
                      if (response.statusCode == 202) {
                        var logging = await user.login();
                        if (logging.success) {
                          Get.to(() => Home());
                        } else {
                          setState(() {
                            error = true;
                          });
                          Fluttertoast.showToast(
                              msg: "${logging.error!.message}",
                              toastLength: Toast.LENGTH_SHORT);
                        }
                      } else {
                        setState(() {
                          error = true;
                        });
                        Fluttertoast.showToast(
                            msg: "${response.error!.message}",
                            toastLength: Toast.LENGTH_SHORT);
                      }
                    }
                  }
                },
                child: Text('Register/Log in'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
