// To parse this JSON data, do
//
//     final syllabusContent = syllabusContentFromJson(jsonString);

import 'dart:convert';

SyllabusContent syllabusContentFromJson(String str) => SyllabusContent.fromJson(json.decode(str));

String syllabusContentToJson(SyllabusContent data) => json.encode(data.toJson());

class SyllabusContent {
    SyllabusContent({
       required this.title,
       required this.content,
    });

    String title;
    List<Content> content;

    factory SyllabusContent.fromJson(Map<String, dynamic> json) => SyllabusContent(
        title: json["title"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class Content {
    Content({
       required this.title,
       required this.link,
    });

    String title;
    String link;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
    };
}
