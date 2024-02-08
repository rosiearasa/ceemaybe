import 'package:flutter/material.dart';
import 'data/user.dart';
import 'data/userdata_db.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CEE Health",
           home: HomePage(),
     
          
          
        );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    _testData();
    return Container( );
  }

  Future _testData() async {
    UserDB db = UserDB();
    await db.database;
    List<User> users = await db.getUsers();
    await db.deleteAll();
    users = await db.getUsers();

    await db
        .insertUser(User('Rosie', 'Arasa', 23, DateTime.parse('12/23/2023')));
    await db.insertUser(
        User('Elena', 'Ferrante', 23, DateTime.parse('12/24/2023')));
    users = await db.getUsers();
    

    debugPrint("insert");
    users.forEach((User user) {
      debugPrint(user.firstName);
    });
  }
}
