class User {
  String firstName;
  String lastName;
  List<Book> books;

  User({
    required this.books,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      books: (json['books'] as List)
          .map((element) => Book.fromJson(element))
          .toList(),
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class Book {
  String title;
  String author;
  String details;
  String bookCover;
  double rating;
  List<Chapter> chapters;

  Book({
    required this.title,
    required this.author,
    required this.details,
    required this.bookCover,
    required this.rating,
    required this.chapters,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        author: json['author'],
        details: json['details'],
        bookCover: json['bookCover'],
        rating: json['rating'],
        chapters: (json['chapters'] as List)
            .map((e) => Chapter.fromJson(e))
            .toList());
  }
}

class Chapter {
  String title;
  String description;
  int pages;
  int chapterNo;

  Chapter({
    required this.title,
    required this.description,
    required this.pages,
    required this.chapterNo,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      title: json['title'],
      description: json['description'],
      pages: json['pages'],
      chapterNo: json['chapterNo'],
    );
  }
}
