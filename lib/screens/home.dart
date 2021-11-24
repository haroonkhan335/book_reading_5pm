import 'dart:developer';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/widgets/home_widgets/best_of_the_day_section.dart';
import 'package:book_reading/widgets/home_widgets/books_catalogue.dart';
import 'package:book_reading/widgets/home_widgets/circle_shape.dart';
import 'package:book_reading/widgets/home_widgets/continue_reading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final HomeArguments args =
        ModalRoute.of(context)!.settings.arguments as HomeArguments;
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: Stack(
            children: [
              CircleShape(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text(
                        'What are you\nreading today?',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    BooksCatalogue(
                        books: args.user.books,
                        onLastPointSaved: (lastPoint) {
                          log("FINAL LAST POINT SAVED CALLED IN HOME");

                          setState(() {
                            args.lastPoint = lastPoint;
                            log('HOME SCREEN STATE WAS RESET');
                          });
                        }),
                    BestOfTheDaySection(
                      topBook: getMeTopBook(args.user.books),
                    ),
                    if (args.lastPoint != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 25),
                        child: ContinueReading(
                          lastPoint: args.lastPoint!,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Book getMeTopBook(List<Book> books) {
    books.sort((a, b) => b.rating.compareTo(a.rating));
    print(books.first.rating);

    books.map((e) => print(e.rating)).toList();
    return books.first;
  }
}

class HomeArguments {
  User user;

  LeftOffBook? lastPoint;

  HomeArguments({required this.user, required this.lastPoint});
}
