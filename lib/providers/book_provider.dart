import 'dart:convert';

import 'package:book_reading/models/left_off_book.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookProvider with ChangeNotifier {
  String? data;

  LeftOffBook? lastPoint;

  late User user;

  Book? currentlyReadingBook;

  Chapter? currentlyReadingChapter;

  int currentlyReadingPage = 1;

  void changePage(int page) {
    currentlyReadingPage = page + 1;

    lastPoint = LeftOffBook(
        pageNo: currentlyReadingPage,
        author: currentlyReadingBook!.author,
        bookCover: currentlyReadingBook!.bookCover,
        chapterNo: currentlyReadingChapter!.chapterNo,
        title: currentlyReadingBook!.title,
        totalChapters: currentlyReadingBook!.chapters.length);
    notifyListeners();
  }

  Future<void> getUsersData() async {
    this.data = await rootBundle.loadString('assets/data/users.json');

    if (data != null) {
      final structuredData = jsonDecode(data!)["users"]["123456"];

      this.user = User.fromJson(structuredData);
    }

    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final lastLeftOffString = sharedPref.getString("lastLeftOff");

    if (lastLeftOffString != null) {
      final rawLastLeftOff = jsonDecode(lastLeftOffString);

      lastPoint = LeftOffBook.fromJson(rawLastLeftOff);
    }
  }

  void navigateToHome(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    });
  }

  // Future<void> saveLeftOffPoint(
  //     {required Book book,
  //     required Chapter chapter,
  //     required int page,

  //     required Function(LeftOffBook) onLastPointSaved}) async {

  //   final LeftOffBook leftOffPoint = LeftOffBook(
  //       pageNo: pageNo,
  //       author: book.author,
  //       bookCover: book.bookCover,
  //       chapterNo: chapter.chapterNo,
  //       title: book.title,
  //       totalChapters: book.chapters.length);

  //   onLastPointSaved(leftOffPoint);
  //   SharedPreferences sharedPref = await SharedPreferences.getInstance();

  //   sharedPref.setString("lastLeftOff", jsonEncode(leftOffPoint.toJson()));
  // }
}
