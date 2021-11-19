import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/book_screen_widget/book_summary.dart';
import 'package:book_reading/widgets/book_screen_widget/details_overlay.dart';
import 'package:book_reading/widgets/common/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key}) : super(key: key);

  static const String routeName = '/book_screen';

  Book? book;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context) != null) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        book = ModalRoute.of(context)!.settings.arguments as Book;
      }
    }
    return Scaffold(
      body: book == null
          ? Center(child: Text('No Book Found'))
          : Stack(
              children: [
                CoverBackground(
                  coverUrl: book!.bookCover,
                ),
                DetailsOverlay(
                  book: book!,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.4,
                    ),
                    Container(
                      height: screenHeight(context) * 0.35,
                      child: ListView.builder(
                        itemCount: 10,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          // final Chapter chapter = book!.chapters[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 20,
                              shadowColor: Colors.black,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("HAHAHAHAHA"),
                                        // 'Chapter ${index + 1}: ${chapter.title}'),
                                        Text("ksajdlfkajsdf"
                                            // chapter.description,
                                            ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}

class CoverBackground extends StatelessWidget {
  CoverBackground({Key? key, required this.coverUrl}) : super(key: key);

  final String coverUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        height: screenHeight(context) * 0.45,
        width: screenWidth(context),
        child: Image(
          image: NetworkImage(coverUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
