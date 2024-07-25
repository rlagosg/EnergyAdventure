
class Questions {
    int answer;
    String category;
    String content;
    String explication;
    String id;
    int level;
    List<String> options;
    Type type;

    Questions({
        required this.answer,
        required this.category,
        required this.content,
        required this.explication,
        required this.id,
        required this.level,
        required this.options,
        required this.type,
    });
}
