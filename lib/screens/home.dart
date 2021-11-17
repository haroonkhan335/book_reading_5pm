import 'package:book_reading/models/user.dart';
import 'package:book_reading/widgets/home_widgets/books_catalogue.dart';
import 'package:book_reading/widgets/home_widgets/circle_shape.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: Stack(
            children: [
              CircleShape(),
              Column(
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
                  Expanded(
                    flex: 4,
                    child: BooksCatalogue(books: user.books),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
