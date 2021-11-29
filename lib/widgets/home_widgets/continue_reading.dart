import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/book_screen_widget/chapter_tile.dart';
import 'package:book_reading/widgets/home_widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContinueReading extends StatefulWidget {
  ContinueReading({
    Key? key,
  }) : super(key: key);

  @override
  _ContinueReadingState createState() => _ContinueReadingState();
}

class _ContinueReadingState extends State<ContinueReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Continue reading ...',
          style: GoogleFonts.poppins(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () async {},
            child: Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 20,
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(lastPoint.title),
                                // 'Chapter ${index + 1}: ${chapter.title}'),
                                Text(
                                  lastPoint.author,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Chapter ${lastPoint.chapterNo} of ${lastPoint.totalChapters}'),
                                    Text('Page : ${lastPoint.pageNo}'),
                                  ],
                                ),
                                BookCover(
                                    bookCover: lastPoint.bookCover,
                                    height: 50,
                                    width: 50)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55)),
                    color: Colors.transparent,
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(42),
                          child: SizedBox(
                            width: screenWidth(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(
                            height: 5,
                            width: calculateWidth(
                                lastPoint.totalChapters, lastPoint.chapterNo),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  LeftOffBook get lastPoint => Provider.of<BookProvider>(context).lastPoint!;

  double calculateWidth(int totalChapter, int chapterNo) {
    double firstChapWidth = screenWidth(context) / totalChapter;

    return firstChapWidth * chapterNo;
  }
}
