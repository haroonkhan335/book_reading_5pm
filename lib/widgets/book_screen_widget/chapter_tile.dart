import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/page.dart';
import 'package:flutter/material.dart';
import 'package:book_reading/screens/page.dart' as PageScreen;

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    final String bookCover = '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(PageScreen.Page.routeName,
              arguments: PageArguments(chapter: chapter));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 20,
          shadowColor: Colors.black,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chapter.title),
                    // 'Chapter ${index + 1}: ${chapter.title}'),
                    Text(
                      chapter.description,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Pages: ${chapter.pages.length}'),
                    Icon(
                      Icons.chevron_right,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
