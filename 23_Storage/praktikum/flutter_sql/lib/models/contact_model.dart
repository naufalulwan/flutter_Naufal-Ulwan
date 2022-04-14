import 'package:flutter_sql/databases/contact_database.dart';

class Contact {
  late int? id;
  late String name;
  late String phoneNumber;

  Contact({this.id, required this.name, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      ContactDatabase.COLUMN_NAME: name,
      ContactDatabase.COLUMN_NUMBER_PHONE: phoneNumber,
    };

    if (id != null) {
      map[ContactDatabase.COLUMN_ID] = id;
    }

    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map[ContactDatabase.COLUMN_ID];
    name = map[ContactDatabase.COLUMN_NAME];
    phoneNumber = map[ContactDatabase.COLUMN_NUMBER_PHONE];
  }
}
