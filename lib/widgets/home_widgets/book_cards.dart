import 'dart:developer';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:book_reading/screens/book_screen.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/home_widgets/book_about.dart';
import 'package:book_reading/widgets/home_widgets/books_catalogue.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookCards extends StatefulWidget {
  BookCards({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  State<BookCards> createState() => _BookCardsState();
}

class _BookCardsState extends State<BookCards> {
  bool isShowingDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.24,
      width: screenWidth(context) * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 18,
          )
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: isShowingDetails
                ? BookDetails(details: widget.book.details)
                : BookAbout(book: widget.book),
          ),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowingDetails = !isShowingDetails;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Details',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<BookProvider>(context, listen: false)
                          .currentlyReadingBook = widget.book;
                      Navigator.of(context).pushNamed(
                        BookScreen.routeName,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                        color: Color(0xFF393939),
                      ),
                      child: Center(
                        child: Text(
                          'Read',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
