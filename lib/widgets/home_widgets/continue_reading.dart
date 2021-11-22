import 'package:book_reading/widgets/book_screen_widget/chapter_tile.dart';
import 'package:flutter/material.dart';

class ContinueReading extends StatefulWidget {
  const ContinueReading({Key? key}) : super(key: key);

  @override
  _ContinueReadingState createState() => _ContinueReadingState();
}

class _ContinueReadingState extends State<ContinueReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Continue Reading'),
        // ChapterTile(chapter: chapter),
      ],
    );
  }
}
