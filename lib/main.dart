import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CEE Health",
        home: Scaffold(
          appBar: AppBar(
            title: Text("CEE Health"),
            backgroundColor: Colors.grey[600],
          ),
        ));
  }
}
