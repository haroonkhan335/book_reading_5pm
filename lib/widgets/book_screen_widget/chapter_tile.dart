import 'dart:developer';

import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/page.dart';
import 'package:flutter/material.dart';
import 'package:book_reading/screens/page.dart' as PageScreen;

class ChapterTile extends StatefulWidget {
  ChapterTile({
    Key? key,
    required this.chapter,
    required this.book,
  }) : super(key: key);

  Chapter chapter;

  Book book;

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
          print('onNameChanged is being passed in the parameters');
          final String data =
              await Navigator.of(context).pushNamed(PageScreen.Page.routeName,
                  arguments: PageArguments(
                      chapter: widget.chapter,
                      book: widget.book,
                      onNameChanged: (Chapter chapter) {
                        log("onNameChanged was called. Setting the state");
                        setState(() {
                          widget.chapter = chapter;
                        });
                      })) as String;

          print(data);
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
                    // 'Chapter ${index + 1}: ${chapter.title}'),
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
