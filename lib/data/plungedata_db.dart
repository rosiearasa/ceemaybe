import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'user.dart';

class PlungeDB {
  //A SINGLETON SETUP TO OPEN THE DATABASE ONCE
  static final PlungeDB _singleton = PlungeDB._internal();
  PlungeDB._internal();

  factory PlungeDB() {
    return _singleton;
  }
}
