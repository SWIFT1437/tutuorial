// To parse this JSON data, do
//
//     final allBooks = allBooksFromJson(jsonString);

import 'dart:convert';

AllBooks allBooksFromJson(String str) => AllBooks.fromJson(json.decode(str));

String allBooksToJson(AllBooks data) => json.encode(data.toJson());

class AllBooks {
  int count;
  List<Book> books;

  AllBooks({
    this.count,
    this.books,
  });

  factory AllBooks.fromJson(Map<String, dynamic> json) => AllBooks(
    count: json["count"],
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Book {
  Cover cover;
  Form form;
  bool available;
  String id;
  String title;
  String author;
  int yearWritten;
  String edition;
  double price;
  List<Author> authors;
  String language;

  Book({
    this.cover,
    this.form,
    this.available,
    this.id,
    this.title,
    this.author,
    this.yearWritten,
    this.edition,
    this.price,
    this.authors,
    this.language,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    cover: Cover.fromJson(json["cover"]),
    form: formValues.map[json["form"]],
    available: json["available"],
    id: json["_id"],
    title: json["title"],
    author: json["author"] == null ? null : json["author"],
    yearWritten: json["year_written"] == null ? null : json["year_written"],
    edition: json["edition"] == null ? null : json["edition"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    language: json["language"] == null ? null : json["language"],
  );

  Map<String, dynamic> toJson() => {
    "cover": cover.toJson(),
    "form": formValues.reverse[form],
    "available": available,
    "_id": id,
    "title": title,
    "author": author == null ? null : author,
    "year_written": yearWritten == null ? null : yearWritten,
    "edition": edition == null ? null : edition,
    "price": price == null ? null : price,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "language": language == null ? null : language,
  };
}

class Author {
  String id;
  String name;

  Author({
    this.id,
    this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class Cover {
  String small;
  String medium;
  String large;

  Cover({
    this.small,
    this.medium,
    this.large,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

enum Form { PAPERBACK, SOFTCOPY }

final formValues = EnumValues({
  "Paperback": Form.PAPERBACK,
  "Softcopy": Form.SOFTCOPY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
