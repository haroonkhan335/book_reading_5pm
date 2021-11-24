import 'package:book_reading/models/user.dart';

class LeftOffBook {
  String title;
  String author;
  String bookCover;

  int chapterNo;
  int totalChapters;

  int pageNo;

  LeftOffBook({
    required this.pageNo,
    required this.author,
    required this.bookCover,
    required this.chapterNo,
    required this.title,
    required this.totalChapters,
  });

  factory LeftOffBook.fromJson(Map<String, dynamic> json) {
    return LeftOffBook(
      pageNo: json["pageNo"],
      author: json["author"],
      bookCover: json["bookCover"],
      chapterNo: json["chapterNo"],
      title: json["title"],
      totalChapters: json["totalChapters"],
    );
  }

  Map<String, dynamic> toJson() => {
        "pageNo": this.pageNo,
        "author": this.author,
        "bookCover": this.bookCover,
        "chapterNo": this.chapterNo,
        "title": this.title,
        "totalChapters": this.totalChapters,
      };
}
