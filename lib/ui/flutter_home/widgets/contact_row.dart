import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactRow extends StatelessWidget {
  const ContactRow({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          localizations.contactMe,
          style: theme.textTheme.labelMedium,
        ),
        GestureDetector(
          onTap: () async {
            await launchUrl(Uri.parse('https://wa.me/+5585987288183'));
          },
          child: Image.asset(
            Assets.whatsapp,
            width: 42,
            height: 42,
          ),
        ),
        GestureDetector(
          onTap: () async {
            await launchUrl(
              Uri(
                scheme: 'mailto',
                path: 'brunoleo.vieira516@gmail.com',
                queryParameters: {
                  'subject': '${localizations.experienceCardRole.trim()}❤️'
                },
              ),
            );
          },
          child: Image.asset(
            Assets.gmail,
            width: 42,
            height: 42,
          ),
        ),
        GestureDetector(
          onTap: () async {
            await launchUrl(
                Uri.parse('https://www.linkedin.com/in/bruno-vieiral/'));
          },
          child: Image.asset(
            Assets.linkedin,
            width: 42,
            height: 42,
          ),
        ),
      ],
    );
  }
}
