import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/utils/url_opener.dart';

class PillLink extends StatelessWidget {
  const PillLink(this.label, this.url, {super.key, this.filled = false});
  final String label, url;
  final bool filled;

  @override
  Widget build(BuildContext context) => Material(
        color: filled ? AppColors.ink : Colors.transparent,
        shape: const StadiumBorder(side: BorderSide(color: AppColors.ink, width: 1.5)),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: () => openUrl(url),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
            child: Text(
              label,
              style: AppText.body(16,
                  color: filled ? Colors.white : AppColors.ink, weight: FontWeight.w600),
            ),
          ),
        ),
      );
}
