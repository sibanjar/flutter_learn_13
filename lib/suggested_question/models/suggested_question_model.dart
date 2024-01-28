class QuestionSuggestion {
  int? id;
  String? title;

  QuestionSuggestion({
    this.id,
    this.title,
  });

  QuestionSuggestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
