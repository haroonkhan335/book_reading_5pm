import 'dart:developer';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/home_widgets/book_about.dart';
import 'package:book_reading/widgets/home_widgets/book_cards.dart';
import 'package:book_reading/widgets/home_widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BooksCatalogue extends StatefulWidget {
  BooksCatalogue({
    Key? key,
  }) : super(key: key);

  @override
  State<BooksCatalogue> createState() => _BooksCatalogueState();
}

class _BooksCatalogueState extends State<BooksCatalogue> {
  bool isShowingBook = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.4,
      child: ListView(
        padding: const EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        children: bookProvider.user.books
            .map(
              (book) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: BookCards(book: book),
                      ),
                    ),
                    isShowingBook
                        ? Positioned(
                            top: 20,
                            left: 20,
                            child: BookCover(
                              bookCover: book.bookCover,
                              height: 80,
                              width: 100,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  BookProvider get bookProvider =>
      Provider.of<BookProvider>(context, listen: false);
}

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.details,
  }) : super(key: key);

  final String details;

  @override
  Widget build(BuildContext context) {
    return Text(details);
  }
}
