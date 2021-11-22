import 'package:book_reading/screens/book_screen.dart';
import 'package:book_reading/screens/home.dart';
import 'package:book_reading/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:book_reading/screens/page.dart' as PageScreen;
import 'package:google_fonts/google_fonts.dart';

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
        PageScreen.Page.routeName: (context) => PageScreen.Page()
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFFFCF6F7),
      ),
    );
  }
}
