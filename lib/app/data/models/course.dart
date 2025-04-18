class Course {
  final String id;
  final String title;
  final String? thumbnail;
  final Author author;
  final int totalChapter;
  final Duration totalDuration;
  final String level;
  final List<String> categories;

  const Course({
    required this.id,
    required this.title,
    this.thumbnail,
    required this.author,
    required this.totalChapter,
    required this.totalDuration,
    required this.level,
    required this.categories,
  });

  factory Course.fromJson(Map<String, dynamic>? json) {
    return Course(
      id: json?['id'] ?? '',
      title: json?['title'] ?? '',
      thumbnail: json?['thumbnail'],
      author: Author.fromJson(json?['author']),
      totalChapter: json?['totalChapter'] ?? 0,
      totalDuration: json?['duration'] ?? Duration(),
      level: json?['level'] ?? '',
      categories: json?[''] ?? [],
    );
  }
}

class Author {
  final String id;
  final String name;
  final String? avatar;

  const Author({required this.id, required this.name, this.avatar});

  factory Author.fromJson(Map<String, dynamic>? json) {
    return Author(
      id: json?['id'] ?? '',
      name: json?['name'] ?? '',
      avatar: json?['avatar'],
    );
  }
}
