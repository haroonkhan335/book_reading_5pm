import 'dart:convert';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page extends StatefulWidget {
  Page({Key? key}) : super(key: key);

  static const String routeName = '/page';

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int pageNo = 0;

  Chapter? lastReadChapter;
  int? lastReadPage;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PageArguments;
    lastReadChapter = data.chapter;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.chapter.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: data.chapter.pages.length,
                      onPageChanged: (int index) {
                        saveLeftOffPoint(
                            book: data.book,
                            chapter: data.chapter,
                            page: index,
                            onLastPointSaved: data.onLastPointSaved);
                      },
                      itemBuilder: (context, index) {
                        final String page = data.chapter.pages[index];
                        return Text(
                          page,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            height: 1.5,
                            fontSize: 19,
                            letterSpacing: 1.5,
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 30,
                            width: 50,
                            child: Text(
                              '${pageNo}/${data.chapter.pages.length}',
                              style: GoogleFonts.poppins(
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveLeftOffPoint(
      {required Book book,
      required Chapter chapter,
      required int page,
      required Function(LeftOffBook) onLastPointSaved}) async {
    setState(() {
      pageNo = page + 1;
    });
    final LeftOffBook leftOffPoint = LeftOffBook(
        pageNo: pageNo,
        author: book.author,
        bookCover: book.bookCover,
        chapterNo: chapter.chapterNo,
        title: book.title,
        totalChapters: book.chapters.length);

    onLastPointSaved(leftOffPoint);
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    sharedPref.setString("lastLeftOff", jsonEncode(leftOffPoint.toJson()));
  }
}

class PageArguments {
  final Chapter chapter;

  final Function(LeftOffBook) onLastPointSaved;

  final Book book;

  PageArguments(
      {required this.chapter,
      required this.onLastPointSaved,
      required this.book});
}
