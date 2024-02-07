import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'user.dart';

class UserDB {
  //A SINGLETON SETUP TO OPEN THE DATABASE ONCE
  static final UserDB _singleton = UserDB._internal();
  UserDB._internal();

  factory UserDB() {
    return _singleton;
  }
}
