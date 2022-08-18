import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseModel {
  static final appId = "com.voyce";
  // final keyParseClientKey = "";
  static final serverUrl = "https://test.voycephone.com/parse/";

  static Future<void> initParse() async {
    await Parse().initialize(appId, serverUrl);
  }


}
