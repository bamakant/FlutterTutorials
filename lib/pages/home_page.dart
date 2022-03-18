import 'package:flutter/material.dart';
import '/widgets/drawer.dart';

//Day 11 we learned about context, widget 3 tree and constraints
// Widget --> Element --> Renterer

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String codepur = "Codepur";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Text("Welcome to $days of Flutter by $codepur"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
