import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAbout extends StatelessWidget {
  const BookAbout({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.title,
          style: GoogleFonts.poppins(
            fontSize: 13,
          ),
        ),
        Text(
          book.author,
          style: GoogleFonts.poppins(color: Colors.grey[400]),
        ),
      ],
    );
  }
}
