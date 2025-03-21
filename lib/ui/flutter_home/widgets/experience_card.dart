import 'package:flutter/material.dart';
import 'package:portfolio/ui/core/theme/colors.dart';
import 'package:portfolio/ui/flutter_home/widgets/base_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../i18n/app_localizations.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return BaseCard(
      backgroundColor: AppColors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localizations.experienceCardTitle,
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              IconButton(
                tooltip: localizations.experienceCardTooltip,
                onPressed: () async {
                  await launchUrl(
                    Uri.parse(
                        'https://www.linkedin.com/in/bruno-vieiral/details/experience/'),
                  );
                },
                icon: Icon(
                  Icons.info,
                  color: theme.iconTheme.color,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  localizations.experienceCardRoleLabel +
                      localizations.experienceCardRole,
                  style: theme.textTheme.labelSmall,
                ),
                Text(
                  localizations.experienceCardEnterpriseLabel +
                      localizations.experienceCardEnterprise1,
                  style: theme.textTheme.labelSmall,
                ),
                Text(
                  localizations.experienceCardDateLabel +
                      localizations.experienceCardDate1,
                  style: theme.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  localizations.experienceCardRoleLabel +
                      localizations.experienceCardRole,
                  style: theme.textTheme.labelSmall,
                ),
                Text(
                  localizations.experienceCardEnterpriseLabel +
                      localizations.experienceCardEnterprise2,
                  style: theme.textTheme.labelSmall,
                ),
                Text(
                  localizations.experienceCardDateLabel +
                      localizations.experienceCardDate2,
                  style: theme.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
