import '../../domain/entities/project.dart';

class ProjectModel {
  const ProjectModel({
    required this.name,
    required this.description,
    required this.stack,
    required this.accent,
    this.url,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) => ProjectModel(
        name: map['name'] as String,
        description: map['description'] as String,
        stack: List<String>.from(map['stack'] as List),
        accent: map['accent'] as int,
        url: map['url'] as String?,
      );

  final String name;
  final String description;
  final List<String> stack;
  final int accent;
  final String? url;

  Project toEntity() => Project(
        name: name,
        description: description,
        stack: stack,
        accentColor: accent,
        url: url,
      );
}
