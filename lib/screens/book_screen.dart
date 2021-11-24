import 'dart:developer';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/book_screen_widget/book_summary.dart';
import 'package:book_reading/widgets/book_screen_widget/chapter_tile.dart';
import 'package:book_reading/widgets/book_screen_widget/details_overlay.dart';
import 'package:book_reading/widgets/common/rating.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key}) : super(key: key);

  static const String routeName = '/book_screen';

  late BookScreenArgs args;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context) != null) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        args = ModalRoute.of(context)!.settings.arguments as BookScreenArgs;
      }
    }
    return Scaffold(
      body: Stack(
        children: [
          CoverBackground(
            coverUrl: args.book.bookCover,
          ),
          DetailsOverlay(
            book: args.book,
          ),
          Column(
            children: [
              SizedBox(
                height: screenHeight(context) * 0.4,
              ),
              Container(
                height: screenHeight(context) * 0.35,
                child: ListView.builder(
                  dragStartBehavior: DragStartBehavior.down,
                  itemCount: args.book.chapters.length,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final Chapter chapter = args.book.chapters[index];
                    return ChapterTile(
                        chapter: chapter,
                        book: args.book,
                        onLastPointSaved: (LeftOffBook lastPoint) {
                          log("LAST POINT WAS SAVED IN BOOK SCREEN WIDGET");
                          args.onLastPointSaved(lastPoint);
                        });
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

class BookScreenArgs {
  Book book;

  Function(LeftOffBook) onLastPointSaved;

  BookScreenArgs({required this.book, required this.onLastPointSaved});
}
