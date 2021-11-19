import 'package:book_reading/models/user.dart';
import 'package:book_reading/widgets/common/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSummary extends StatelessWidget {
  const BookSummary({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          book.author,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                book.details,
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Rating(rating: book.rating),
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text('Read'),
          ),
        ),
      ],
    );
  }
}
