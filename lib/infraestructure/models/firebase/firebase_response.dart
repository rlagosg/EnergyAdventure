
class FirebaseResponse {
    final int answer;
    final String category;
    final String content;
    final String explication;
    final String id;
    final int level;
    final List<String> options;
    final String type;

    FirebaseResponse({
        required this.answer,
        required this.category,
        required this.content,
        required this.explication,
        required this.id,
        required this.level,
        required this.options,
        required this.type,
    });

    factory FirebaseResponse.fromJson(Map<String, dynamic> json) => FirebaseResponse(
        answer      : json["answer"],
        category    : json["category"],
        content     : json["content"],
        explication : json["explication"],
        id          : json["id"],
        level       : json["level"],
        options     : List<String>.from(json["options"].map((x) => x)),
        type        : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "answer"      : answer,
        "category"    : category,
        "content"     : content,
        "explication" : explication,
        "id"          : id,
        "level"       : level,
        "options"     : List<dynamic>.from(options.map((x) => x)),
        "type"        : type,
    };
}

