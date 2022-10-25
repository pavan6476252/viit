// To parse this JSON data, do
//
//     final viitApiModel = viitApiModelFromJson(jsonString);

import 'dart:convert';

ViitApiModel viitApiModelFromJson(String str) => ViitApiModel.fromJson(json.decode(str));

String viitApiModelToJson(ViitApiModel data) => json.encode(data.toJson());

class ViitApiModel {
    ViitApiModel({
        required this.title,
        required this.image,
        required this.content,
    });

    String title;
    String image;
    List<ViitApiModelContent> content;

    factory ViitApiModel.fromJson(Map<String, dynamic> json) => ViitApiModel(
        title: json["title"],
        image: json["image"],
        content: List<ViitApiModelContent>.from(json["content"].map((x) => ViitApiModelContent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class ViitApiModelContent {
    ViitApiModelContent({
        required this.title,
        required this.content,
    });

    String title;
    List<ContentContent> content;

    factory ViitApiModelContent.fromJson(Map<String, dynamic> json) => ViitApiModelContent(
        title: json["title"],
        content: List<ContentContent>.from(json["content"].map((x) => ContentContent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class ContentContent {
    ContentContent({
        required this.title,
        required this.link,
    });

    String title;
    String link;

    factory ContentContent.fromJson(Map<String, dynamic> json) => ContentContent(
        title: json["title"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
    };
}
