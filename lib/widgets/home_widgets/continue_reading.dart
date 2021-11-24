import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/widgets/book_screen_widget/chapter_tile.dart';
import 'package:flutter/material.dart';

class ContinueReading extends StatefulWidget {
  ContinueReading({Key? key, required this.lastPoint}) : super(key: key);

  LeftOffBook lastPoint;
  @override
  _ContinueReadingState createState() => _ContinueReadingState();
}

class _ContinueReadingState extends State<ContinueReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Continue Reading'),
        Text(widget.lastPoint.title),
        Text(widget.lastPoint.author),
        Text(widget.lastPoint.chapterNo.toString()),
        Text(widget.lastPoint.pageNo.toString()),
      ],
    );
  }
}
