import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:portfolio/ui/core/theme/app_dimensions.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';

class ContactRow extends StatelessWidget {
  const ContactRow({
    super.key,
    required this.homeViewModel,
  });

  final FlutterHomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Text(
          localizations.contactMe,
          style: theme.textTheme.labelMedium,
        ),
        GestureDetector(
          onTap: homeViewModel.openWhatsApp,
          child: Image.asset(
            Assets.whatsapp,
            width: AppDimensions.iconSize,
            height: AppDimensions.iconSize,
          ),
        ),
        GestureDetector(
          onTap: () =>
              homeViewModel.sendEmail(localizations.experienceCardRole),
          child: Image.asset(
            Assets.gmail,
            width: AppDimensions.iconSize,
            height: AppDimensions.iconSize,
          ),
        ),
        GestureDetector(
          onTap: homeViewModel.openLinkedIn,
          child: Image.asset(
            Assets.linkedin,
            width: AppDimensions.iconSize,
            height: AppDimensions.iconSize,
          ),
        ),
      ],
    );
  }
}
