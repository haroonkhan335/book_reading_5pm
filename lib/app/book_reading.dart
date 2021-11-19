import 'package:book_reading/screens/book_screen.dart';
import 'package:book_reading/screens/home.dart';
import 'package:book_reading/screens/splash.dart';
import 'package:flutter/material.dart';

class BookReading extends StatelessWidget {
  const BookReading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        Home.routeName: (context) => Home(),
        BookScreen.routeName: (context) => BookScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFCF6F7),
      ),
    );
  }
}
