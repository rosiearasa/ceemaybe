import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'user.dart';

class UserDB {
  //A SINGLETON SETUP TO OPEN THE DATABASE ONCE
   UserDB._internal();
  static final UserDB _singleton = UserDB._internal();
  

  factory UserDB() {
    return _singleton;
  }


  DatabaseFactory dbFactory = databaseFactoryIo;
  final store = intMapStoreFactory.store('users');

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      await _openDB().then((db) {
        _database = db;
      });
    }
    return _database;
  }

  Future _openDB() async {
    final docsPath = await getApplicationDocumentsDirectory();

    final dbPath = join(docsPath.path, 'users.db');
    final db = await dbFactory.openDatabase(dbPath);
    return db;
  }

  Future insertUser(User user) async {
    await store.add(_database!, user.toMap());
  }

  Future updateUser(User user) async {
    final finder = Finder(filter: Filter.byKey(user.id));
    await store.update(_database!, user.toMap(), finder: finder);
  }

  Future deleteUser(User user) async {
    final finder = Finder(filter: Filter.byKey(user.id));
    await store.delete(_database!, finder: finder);
  }

  Future deleteAll() async {
    //delete all records
    await store.delete(_database!);
  }

  Future<List<User>> getUsers() async {
    await database;
    final finder = Finder(sortOrders: [
      SortOrder('dateJoined')
    ]);

    final usersSnapshot = await store.find(_database!, finder: finder);
    return usersSnapshot.map((snapshot) {
      final user = User.fromMap(snapshot.value);
      user.id = snapshot.key;
      return user;
  }).toList();
}



}
