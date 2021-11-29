import 'dart:developer';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:book_reading/screens/page.dart';
import 'package:flutter/material.dart';
import 'package:book_reading/screens/page.dart' as PageScreen;
import 'package:provider/provider.dart';

class ChapterTile extends StatefulWidget {
  ChapterTile({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  Chapter chapter;

  @override
  State<ChapterTile> createState() => _ChapterTileState();
}

class _ChapterTileState extends State<ChapterTile> {
  @override
  Widget build(BuildContext context) {
    final String bookCover = '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          Provider.of<BookProvider>(context, listen: false)
              .currentlyReadingChapter = widget.chapter;
          await Navigator.of(context).pushNamed(PageScreen.Page.routeName);
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
                    Text(widget.chapter.title),
                    Text(
                      widget.chapter.description,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Pages: ${widget.chapter.pages.length}'),
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
