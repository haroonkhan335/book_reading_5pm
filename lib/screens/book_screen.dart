import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/book_screen_widget/chapter_tile.dart';
import 'package:book_reading/widgets/book_screen_widget/details_overlay.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key}) : super(key: key);

  static const String routeName = '/book_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CoverBackground(
            coverUrl: bookProvider(context).currentlyReadingBook!.bookCover,
          ),
          DetailsOverlay(
            book: bookProvider(context).currentlyReadingBook!,
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
                  itemCount: bookProvider(context)
                      .currentlyReadingBook!
                      .chapters
                      .length,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final Chapter chapter = bookProvider(context)
                        .currentlyReadingBook!
                        .chapters[index];
                    return ChapterTile(
                      chapter: chapter,
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

  BookProvider bookProvider(context) => Provider.of<BookProvider>(context);
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

  BookScreenArgs({required this.book});
}
