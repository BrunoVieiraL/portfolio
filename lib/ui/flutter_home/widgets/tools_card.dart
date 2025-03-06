import 'package:flutter/material.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:portfolio/ui/flutter_home/widgets/base_card.dart';

class ToolsCard extends StatelessWidget {
  const ToolsCard({super.key, required this.listIcons});

  final List<String> listIcons;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return BaseCard(
      backgroundColor: Color(0xFF622E9F),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          SizedBox(),
          Text(
            localizations.toolCardTitle,
            style: theme.textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 150,
              ),
              itemCount: listIcons.length,
              itemBuilder: (context, index) => Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                preferBelow: false,
                textAlign: TextAlign.center,
                message: listIcons[index]
                    .replaceAll('.png', '')
                    .replaceAll('assets/icons/', '')
                    .toUpperCase(),
                child: Image.asset(
                  listIcons[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
