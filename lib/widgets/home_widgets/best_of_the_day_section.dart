import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/common/rating.dart';
import 'package:book_reading/widgets/home_widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestOfTheDaySection extends StatelessWidget {
  BestOfTheDaySection({Key? key, required this.topBook}) : super(key: key);

  final Book topBook;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Best Of The Day',
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth(context) * 0.4,
                        child: Text(
                          topBook.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        topBook.author,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Rating(rating: topBook.rating),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              // height: 50,
                              width: screenWidth(context) * 0.35,
                              child: Text(
                                topBook.details,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            right: 20,
            top: -10,
            child: BookCover(
              bookCover: topBook.bookCover,
              height: 150,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }
}
