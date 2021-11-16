import 'dart:convert';

import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getUsersData();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    super.initState();
  }

  String? data;

  Future<void> getUsersData() async {
    this.data = await rootBundle.loadString('assets/data/users.json');

    if (data != null) {
      Map<String, dynamic> structuredData = jsonDecode(data!);

      final Map<String, dynamic> currentUser =
          structuredData["users"]["123456"];

      final User user = User.fromJson(currentUser);

      print('${user.firstName} ${user.lastName} ${user.books}');

      user.books.forEach((element) {
        print(element.chapters);

        element.chapters.forEach((element) {
          print(element.chapterNo);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.bookReader,
              size: 150,
              color: Color(0xFFEABCB1),
            ),
            SizedBox(height: 20),
            Text(
              'Book Reading',
              style: GoogleFonts.dancingScript(
                fontSize: 48,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
