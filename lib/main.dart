import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoute.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoute.homeRoute: (context) => const HomePage(),
        MyRoute.loginRoute: (context) => const LoginPage(),
        MyRoute.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
