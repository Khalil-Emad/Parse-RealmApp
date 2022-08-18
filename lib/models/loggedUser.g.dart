// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loggedUser.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class LoggedUser extends _LoggedUser with RealmEntity, RealmObject {
  LoggedUser({
    String? walletAmount,
    String? walletTransactionDate,
    String? activityAmount,
    String? activityTransactionDate,
  }) {
    RealmObject.set(this, 'walletAmount', walletAmount);
    RealmObject.set(this, 'walletTransactionDate', walletTransactionDate);
    RealmObject.set(this, 'activityAmount', activityAmount);
    RealmObject.set(this, 'activityTransactionDate', activityTransactionDate);
  }

  LoggedUser._();

  @override
  String? get walletAmount =>
      RealmObject.get<String>(this, 'walletAmount') as String?;
  @override
  set walletAmount(String? value) =>
      RealmObject.set(this, 'walletAmount', value);

  @override
  String? get walletTransactionDate =>
      RealmObject.get<String>(this, 'walletTransactionDate') as String?;
  @override
  set walletTransactionDate(String? value) =>
      RealmObject.set(this, 'walletTransactionDate', value);

  @override
  String? get activityAmount =>
      RealmObject.get<String>(this, 'activityAmount') as String?;
  @override
  set activityAmount(String? value) =>
      RealmObject.set(this, 'activityAmount', value);

  @override
  String? get activityTransactionDate =>
      RealmObject.get<String>(this, 'activityTransactionDate') as String?;
  @override
  set activityTransactionDate(String? value) =>
      RealmObject.set(this, 'activityTransactionDate', value);

  @override
  Stream<RealmObjectChanges<LoggedUser>> get changes =>
      RealmObject.getChanges<LoggedUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(LoggedUser._);
    return const SchemaObject(LoggedUser, 'LoggedUser', [
      SchemaProperty('walletAmount', RealmPropertyType.string, optional: true),
      SchemaProperty('walletTransactionDate', RealmPropertyType.string,
          optional: true),
      SchemaProperty('activityAmount', RealmPropertyType.string,
          optional: true),
      SchemaProperty('activityTransactionDate', RealmPropertyType.string,
          optional: true),
    ]);
  }
}
