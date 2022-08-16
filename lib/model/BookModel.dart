// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  Cover cover;
  List<dynamic> tags;
  String form;
  List<String> genres;
  bool available;
  String id;
  String title;
  int yearWritten;
  String author;
  int length;
  String language;
  dynamic price;
  String edition;
  String goodreadsURL;
  List<Author> authors;
  String isbn;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  BookModel({
    this.cover,
    this.tags,
    this.form,
    this.genres,
    this.available,
    this.id,
    this.title,
    this.yearWritten,
    this.author,
    this.length,
    this.language,
    this.price,
    this.edition,
    this.goodreadsURL,
    this.authors,
    this.isbn,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    cover: Cover.fromJson(json["cover"]),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    form: json["form"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    available: json["available"],
    id: json["_id"],
    title: json["title"],
    author: json["author"],
    yearWritten: json["yearWritten"],
    length: json["length"],
    language: json["language"],
    goodreadsURL: json["goodreadsURL"],
    price: json["price"],
    edition: json["edition"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    isbn: json["ISBN"],
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "cover": cover.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "form": form,
    "genres": List<String>.from(genres.map((x) => x)),
    "available": available,
    "_id": id,
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "ISBN": isbn,
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
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
