import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../domain/entities/project.dart';
import 'project_row.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects', style: AppText.display(44)),
          const SizedBox(height: 28),
          const Divider(color: AppColors.line, height: 1, thickness: 1),
          for (final p in projects) ProjectRow(project: p),
        ],
      );
}
