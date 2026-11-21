import 'package:flutter/material.dart';

import '../../../../core/theme/app_text.dart';
import '../../domain/entities/profile.dart';
import 'pill_link.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: AppText.display(44)),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(profile.about, style: AppText.body(19)),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PillLink('GitHub', profile.githubUrl, filled: true),
              PillLink('LinkedIn', profile.linkedinUrl),
            ],
          ),
        ],
      );
}
