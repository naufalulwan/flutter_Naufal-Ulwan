import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact_model.dart';

class ContactDatabase {
  static const String TABLE_CONTACT = 'contact';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_NUMBER_PHONE = 'numberPhone';

  ContactDatabase._init();
  static final ContactDatabase db = ContactDatabase._init();

  Database? _database;

  Future<Database?> get database async {
    print('Database telah terpanggil');
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'ContactDB.db'), version: 1,
        onCreate: (Database database, int version) async {
      print('Membuat contact table');

      await database.execute("CREATE TABLE $TABLE_CONTACT("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT,"
          "$COLUMN_NUMBER_PHONE TEXT)");
    });
  }

  Future<List<Contact>> getContacts() async {
    final db = await database;

    var contacts = await db!.query(TABLE_CONTACT,
        columns: [COLUMN_ID, COLUMN_NAME, COLUMN_NUMBER_PHONE]);

    List<Contact> contactList = <Contact>[];

    contacts.forEach((element) {
      Contact contact = Contact.fromMap(element);
      contactList.add(contact);
    });

    return contactList;
  }

  Future<Contact> insert(Contact contacts) async {
    final db = await database;
    contacts.id = await db!.insert(TABLE_CONTACT, contacts.toMap());
    return contacts;
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db!.delete(TABLE_CONTACT, where: "id = ?", whereArgs: [id]);
  }
}
