import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:portfolio/ui/core/localization/localization.dart';
import 'package:portfolio/ui/core/view_model/app_settings_view_model.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({
    super.key,
    required this.homeViewModel,
    required this.settingsViewModel,
  });

  final FlutterHomeViewModel homeViewModel;
  final AppSettingsViewModel settingsViewModel;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Row(
      children: [
        InkWell(
          onTapDown: (tapdownDetails) async {
            await showMenu(
              context: context,
              constraints: BoxConstraints(maxWidth: width * 0.06),
              position: RelativeRect.fromSize(
                Rect.fromPoints(
                  tapdownDetails.globalPosition,
                  tapdownDetails.globalPosition,
                ),
                Size(width, height),
              ),
              items: [
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15,
                    children: [
                      Text('BR'),
                      Image.asset(Assets.brFlag),
                    ],
                  ),
                  onTap: () =>
                      settingsViewModel.currentLocale = AppLocalization.br,
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15,
                    children: [
                      Text('EN'),
                      Image.asset(Assets.enFlag),
                    ],
                  ),
                  onTap: () =>
                      settingsViewModel.currentLocale = AppLocalization.en,
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15,
                    children: [
                      Text('ES'),
                      Image.asset(Assets.esFlag),
                    ],
                  ),
                  onTap: () =>
                      settingsViewModel.currentLocale = AppLocalization.es,
                ),
              ],
            );
          },
          child: Row(
            spacing: 10,
            children: [
              Icon(
                Icons.language,
                color: theme.iconTheme.color,
              ),
              Text(
                localizations.language,
                style: theme.textTheme.labelSmall,
              ),
              Image.asset(
                Assets.changeFlag(localizations.language.toLowerCase()),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            settingsViewModel.isDark = !settingsViewModel.isDark;
          },
          icon: Icon(
            settingsViewModel.isDark ? Icons.dark_mode : Icons.light_mode,
            color: theme.iconTheme.color,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: theme.iconTheme.color,
          ),
        ),
      ],
    );
  }
}
