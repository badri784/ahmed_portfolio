class Project {
  const Project({
    required this.name,
    required this.description,
    required this.stack,
    required this.accentColor,
    this.url,
  });

  final String name;
  final String description;
  final List<String> stack;

  /// ARGB value, e.g. 0xFF0B5D4B. Kept as int so the domain stays free of Flutter.
  final int accentColor;
  final String? url;
}
