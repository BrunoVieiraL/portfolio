import 'package:flutter/material.dart';
import 'package:portfolio/ui/flutter_home/widgets/base_card.dart';
import '../../../i18n/app_localizations.dart';

class AboutMeCard extends StatelessWidget {
  const AboutMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return BaseCard(
      backgroundColor: Color(0xFF1565C0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          SizedBox(),
          Text(
            localizations.aboutMeCardTitle,
            style: theme.textTheme.labelMedium,
          ),
          Expanded(
            child: Center(
              heightFactor: 1.5,
              child: Text(
                localizations.aboutMeCardText,
                style: theme.textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
