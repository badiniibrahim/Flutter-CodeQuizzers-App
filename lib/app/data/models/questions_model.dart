class QuestionsModel {
  final int? id;
  final String? question;
  final String? description;
  final Map<String, String?>? answers;
  final Map<String, bool>? correctAnswers;
  final String? explanation;
  final List<Tag>? tags;
  final String? category;
  final String? difficulty;

  QuestionsModel({
    this.id,
    this.question,
    this.description,
    this.answers,
    this.correctAnswers,
    this.explanation,
    this.tags,
    this.category,
    this.difficulty,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      id: json['id'] as int,
      question: json['question'] as String,
      description: json['description'] ?? '',
      answers: (json['answers'] as Map)
          .map((key, value) => MapEntry(key as String, value as String?)),
      correctAnswers: (json['correct_answers'] as Map)
          .map((key, value) => MapEntry(key as String, value == 'true')),
      explanation: json['explanation'],
      tags: (json['tags'] as List<dynamic>)
          .map((tagJson) => Tag.fromJson(tagJson))
          .toList(),
      category: json['category'] as String,
      difficulty: json['difficulty'] as String,
    );
  }

  String get correctAnswer => answers!.entries
      .firstWhere((entry) => correctAnswers!['${entry.key}_correct'] == true)
      .value!;
}

class Tag {
  final String name;

  Tag({required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      name: json['name'] as String,
    );
  }
}
