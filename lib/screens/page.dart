import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                        setState(() {
                          pageNo = index + 1;
                          lastReadPage = index;
                          data.chapter.title = "Haroon";
                        });
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
                      child: Container(
                        height: 30,
                        width: 50,
                        child: Text(
                          '${pageNo}/${data.chapter.pages.length}',
                          style: GoogleFonts.poppins(
                            fontSize: 21,
                          ),
                        ),
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

class PageArguments {
  final Chapter chapter;

  PageArguments({required this.chapter});
}
