import 'package:flutter/material.dart';
import '/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String codepur = "Codepur";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days of Flutter by $codepur"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
