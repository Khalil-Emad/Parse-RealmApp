import 'package:realm/realm.dart';
part 'slaveUser.g.dart';

@RealmModel()
class _SlaveUser {
  String? name;
  String? amount;
  String? date;
}
