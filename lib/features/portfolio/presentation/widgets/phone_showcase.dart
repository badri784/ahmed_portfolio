import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../domain/entities/project.dart';

class PhoneShowcase extends StatefulWidget {
  const PhoneShowcase({super.key, required this.projects});
  final List<Project> projects;

  @override
  State<PhoneShowcase> createState() => _PhoneShowcaseState();
}

class _PhoneShowcaseState extends State<PhoneShowcase> {
  final _pc = PageController();
  Timer? _timer;
  int _i = 0;

  int get _count => widget.projects.length;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) => _go((_i + 1) % _count));
  }

  void _go(int i) {
    if (!mounted || !_pc.hasClients) return;
    if (MediaQuery.of(context).disableAnimations) {
      _pc.jumpToPage(i);
    } else {
      _pc.animateToPage(i,
          duration: const Duration(milliseconds: 450), curve: Curves.easeOutCubic);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: 290,
        height: 580,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(44)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pc,
                itemCount: _count,
                onPageChanged: (i) => setState(() => _i = i),
                itemBuilder: (_, i) => _Screen(widget.projects[i]),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var d = 0; d < _count; d++)
                      GestureDetector(
                        onTap: () => _go(d),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: d == _i ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: d == _i ? Colors.white : Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _Screen extends StatelessWidget {
  const _Screen(this.project);
  final Project project;

  @override
  Widget build(BuildContext context) => Container(
        color: Color(project.accentColor),
        padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0x29FFFFFF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(project.name[0], style: AppText.display(32, color: Colors.white)),
            ),
            const Spacer(),
            Text(project.name, style: AppText.display(40, color: Colors.white)),
            const SizedBox(height: 12),
            Text(project.description, style: AppText.body(15, color: Colors.white70)),
            const SizedBox(height: 56),
          ],
        ),
      );
}
