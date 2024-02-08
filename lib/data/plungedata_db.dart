import 'dart:async';
import 'package:cee_prototype/data/plunge.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'plunge.dart';

class PlungeDB {
  //A SINGLETON SETUP TO OPEN THE DATABASE ONCE
  static final PlungeDB _singleton = PlungeDB._internal();
  PlungeDB._internal();

  factory PlungeDB() {
    return _singleton;
  }

  DatabaseFactory dbFactory = databaseFactoryIo;
  final store = intMapStoreFactory.store('plunges');

  static Database ? _database;

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

    final dbPath = join(docsPath.path, 'plunges.db');
    final db = await dbFactory.openDatabase(dbPath);
    return db;
  }

  Future insertPlunge(Plunge plunge) async {
    await store.add(_database!, plunge.toMap());
  }

  Future updatePlunge(Plunge plunge) async {
    final finder = Finder(filter: Filter.byKey(plunge.id));
    await store.update(_database!, plunge.toMap(), finder: finder);
  }

  Future deletePlunge(Plunge plunge) async {
    final finder = Finder(filter: Filter.byKey(plunge.id));
    await store.delete(_database!, finder: finder);
  }

  Future deleteAll() async {
    //delete all records
    await store.delete(_database!);
  }

  Future<List<Plunge>> getPlunges() async {
    await database;
    final finder = Finder(sortOrders: [
      SortOrder('dateTimeStarted'),
      SortOrder('dateTimeCompleted'),

    ]);

    final plungesSnapshot = await store.find(_database!, finder: finder);
    return plungesSnapshot.map((snapshot) {
      final plunge = Plunge.fromMap(snapshot.value);
      plunge.id = snapshot.key;
      return plunge;
  }).toList();
}
}