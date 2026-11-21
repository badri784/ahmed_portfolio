import 'package:flutter/material.dart';

import '../../../../core/theme/app_text.dart';
import '../controllers/portfolio_controller.dart';
import '../widgets/about_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/projects_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});
  final PortfolioController controller;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListenableBuilder(
          listenable: controller,
          builder: (context, _) => switch (controller.status) {
            LoadStatus.loading => const Center(child: CircularProgressIndicator()),
            LoadStatus.failure => _Failure(message: controller.error, onRetry: controller.load),
            LoadStatus.loaded => _Content(controller: controller),
          },
        ),
      );
}

class _Content extends StatelessWidget {
  const _Content({required this.controller});
  final PortfolioController controller;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 860;
    final profile = controller.profile!;
    final projects = controller.projects;

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wide ? 48 : 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroSection(profile: profile, projects: projects),
                const SizedBox(height: 96),
                ProjectsSection(projects: projects),
                const SizedBox(height: 96),
                AboutSection(profile: profile),
                const SizedBox(height: 72),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  const _Failure({required this.message, required this.onRetry});
  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Could not load the portfolio.', style: AppText.body(18)),
            if (message != null) Text(message!, style: AppText.body(14)),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      );
}
