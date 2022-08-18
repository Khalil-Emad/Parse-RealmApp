import 'package:realm/realm.dart';
part 'loggedUser.g.dart';

@RealmModel()
class _LoggedUser {
  String? walletAmount;
  String? walletTransactionDate;
  String? activityAmount;
  String? activityTransactionDate;
}
