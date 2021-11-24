import 'dart:convert';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

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
      Navigator.of(context).pushReplacementNamed(
        Home.routeName,
        arguments: HomeArguments(
          user: user,
          lastPoint: lastPoint,
        ),
      );
    });

    super.initState();
  }

  String? data;

  LeftOffBook? lastPoint;

  late User user;

  Future<void> getUsersData() async {
    this.data = await rootBundle.loadString('assets/data/users.json');

    if (data != null) {
      final structuredData = jsonDecode(data!)["users"]["123456"];

      this.user = User.fromJson(structuredData);
    }

    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final lastLeftOffString = sharedPref.getString("lastLeftOff");

    if (lastLeftOffString != null) {
      final rawLastLeftOff = jsonDecode(lastLeftOffString);
      print("LAST LEFT OFF: ${rawLastLeftOff.runtimeType}");

      lastPoint = LeftOffBook.fromJson(rawLastLeftOff);
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
