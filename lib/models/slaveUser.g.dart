// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slaveUser.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class SlaveUser extends _SlaveUser with RealmEntity, RealmObject {
  SlaveUser({
    String? name,
    String? amount,
    String? date,
  }) {
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'amount', amount);
    RealmObject.set(this, 'date', date);
  }

  SlaveUser._();

  @override
  String? get name => RealmObject.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObject.set(this, 'name', value);

  @override
  String? get amount => RealmObject.get<String>(this, 'amount') as String?;
  @override
  set amount(String? value) => RealmObject.set(this, 'amount', value);

  @override
  String? get date => RealmObject.get<String>(this, 'date') as String?;
  @override
  set date(String? value) => RealmObject.set(this, 'date', value);

  @override
  Stream<RealmObjectChanges<SlaveUser>> get changes =>
      RealmObject.getChanges<SlaveUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(SlaveUser._);
    return const SchemaObject(SlaveUser, 'SlaveUser', [
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('amount', RealmPropertyType.string, optional: true),
      SchemaProperty('date', RealmPropertyType.string, optional: true),
    ]);
  }
}
