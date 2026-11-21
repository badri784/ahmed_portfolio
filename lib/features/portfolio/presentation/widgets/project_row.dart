import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/utils/url_opener.dart';
import '../../domain/entities/project.dart';

class ProjectRow extends StatefulWidget {
  const ProjectRow({super.key, required this.project});
  final Project project;

  @override
  State<ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<ProjectRow> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final url = p.url;
    final wide = MediaQuery.sizeOf(context).width > 860;

    final title = Text(p.name, style: AppText.display(28));
    final desc = Text(p.description, style: AppText.body(16, color: AppColors.muted));
    final stack = Text(
      p.stack.join(', '),
      style: AppText.body(14, color: Color(p.accentColor), weight: FontWeight.w700),
    );

    return MouseRegion(
      cursor: url == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: url == null ? null : () => openUrl(url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: EdgeInsets.symmetric(vertical: 26, horizontal: _hover ? 14 : 0),
          decoration: BoxDecoration(
            color: _hover ? Colors.white : Colors.transparent,
            border: const Border(bottom: BorderSide(color: AppColors.line)),
          ),
          child: wide
              ? Row(
                  children: [
                    SizedBox(width: 320, child: title),
                    Expanded(child: desc),
                    SizedBox(
                      width: 170,
                      child: Align(alignment: Alignment.centerRight, child: stack),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [title, const SizedBox(height: 8), desc, const SizedBox(height: 8), stack],
                ),
        ),
      ),
    );
  }
}
