import 'dart:convert';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page extends StatefulWidget {
  Page({Key? key}) : super(key: key);

  static const String routeName = '/page';

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  Chapter? lastReadChapter;
  int? lastReadPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<BookProvider>(context, listen: false)
            .currentlyReadingChapter!
            .title),
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
                      itemCount:
                          Provider.of<BookProvider>(context, listen: false)
                              .currentlyReadingChapter!
                              .pages
                              .length,
                      onPageChanged: (int index) {
                        Provider.of<BookProvider>(context, listen: false)
                            .changePage(index);
                      },
                      itemBuilder: (context, index) {
                        final String page =
                            Provider.of<BookProvider>(context, listen: false)
                                .currentlyReadingChapter!
                                .pages[index];
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
                            child: Consumer<BookProvider>(
                                builder: (context, provider, _) {
                              return Text(
                                '${provider.currentlyReadingPage}/${Provider.of<BookProvider>(context, listen: false).currentlyReadingChapter!.pages.length}',
                                style: GoogleFonts.poppins(
                                  fontSize: 21,
                                ),
                              );
                            }),
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
}
