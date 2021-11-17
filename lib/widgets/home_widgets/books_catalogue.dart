import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksCatalogue extends StatefulWidget {
  BooksCatalogue({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  State<BooksCatalogue> createState() => _BooksCatalogueState();
}

class _BooksCatalogueState extends State<BooksCatalogue> {
  bool isShowingBook = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20.0),
      scrollDirection: Axis.horizontal,
      children: widget.books
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
                      child: BookCards(
                          book: book,
                          onDetailsPressed: (bool isShowingDetails) {
                            setState(() {
                              this.isShowingBook = !isShowingDetails;
                            });
                          }),
                    ),
                  ),
                  isShowingBook
                      ? Positioned(
                          top: 20,
                          left: 20,
                          child: BookCover(book: book),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class BookCards extends StatefulWidget {
  BookCards({
    Key? key,
    required this.book,
    required this.onDetailsPressed,
  }) : super(key: key);

  final Book book;

  final Function(bool) onDetailsPressed;

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
                        if (isShowingDetails == true) {
                          isShowingDetails = false;
                        } else if (isShowingDetails == false) {
                          isShowingDetails = true;
                        }
                        // isShowingDetails = !isShowingDetails;
                      });
                      widget.onDetailsPressed(isShowingDetails);
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

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            book.bookCover,
          ),
        ),
      ),
    );
  }
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
