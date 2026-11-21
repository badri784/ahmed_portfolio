import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../domain/entities/profile.dart';
import '../../domain/entities/project.dart';
import 'phone_showcase.dart';
import 'pill_link.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key, required this.profile, required this.projects});
  final Profile profile;
  final List<Project> projects;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.of(context).disableAnimations) {
      _c.value = 1;
    } else if (_c.value == 0 && !_c.isAnimating) {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Animation<double> _iv(double a, double b) =>
      CurvedAnimation(parent: _c, curve: Interval(a, b, curve: Curves.easeOutCubic));

  Widget _reveal(Animation<double> a, Widget child, {Offset from = const Offset(0, 0.08)}) =>
      FadeTransition(
        opacity: a,
        child: SlideTransition(
          position: Tween<Offset>(begin: from, end: Offset.zero).animate(a),
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 860;
    final p = widget.profile;

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _reveal(_iv(0, .45), Text(p.name, style: AppText.display(wide ? 132 : 84))),
        const SizedBox(height: 22),
        _reveal(
          _iv(.15, .6),
          Text(p.headline, style: AppText.body(wide ? 26 : 20, weight: FontWeight.w500)),
        ),
        const SizedBox(height: 12),
        _reveal(
          _iv(.25, .7),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Text(p.intro, style: AppText.body(17, color: AppColors.muted)),
          ),
        ),
        const SizedBox(height: 28),
        _reveal(
          _iv(.35, .8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PillLink('GitHub', p.githubUrl, filled: true),
              PillLink('LinkedIn', p.linkedinUrl),
            ],
          ),
        ),
      ],
    );

    final phone = _reveal(
      _iv(.3, 1),
      PhoneShowcase(projects: widget.projects),
      from: const Offset(0, .12),
    );

    return Padding(
      padding: EdgeInsets.only(top: wide ? 96 : 56),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Expanded(child: intro), const SizedBox(width: 48), phone],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [intro, const SizedBox(height: 48), Center(child: phone)],
            ),
    );
  }
}
