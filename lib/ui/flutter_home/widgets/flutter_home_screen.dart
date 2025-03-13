import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/ui/core/theme/app_dimensions.dart';
import 'package:portfolio/ui/core/theme/platform_handler.dart';
import 'package:portfolio/ui/core/view_model/app_settings_view_model.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'widgets.dart';

class FlutterHomeScreen extends StatefulWidget {
  const FlutterHomeScreen({
    super.key,
    required this.homeViewModel,
    required this.settingsViewModel,
  });

  final FlutterHomeViewModel homeViewModel;
  final AppSettingsViewModel settingsViewModel;

  @override
  State<FlutterHomeScreen> createState() => _FlutterHomeScreenState();
}

class _FlutterHomeScreenState extends State<FlutterHomeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.homeViewModel.initControllers(this);
  }

  @override
  void dispose() {
    widget.homeViewModel.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: widget.settingsViewModel,
      builder: (context, _) => Scaffold(
        backgroundColor:
            widget.settingsViewModel.currentTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: width * AppDimensions.leadingWidth,
          leading: PlatformHandler.extraLarge(context)
              ? ContactRow(homeViewModel: widget.homeViewModel)
              : null,
          actions: [
            ActionsRow(
              homeViewModel: widget.homeViewModel,
              settingsViewModel: widget.settingsViewModel,
            ),
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(Assets.me),
                  radius: height * AppDimensions.avatarRadiusFactor,
                ),
                Text(
                  'Bruno Vieira',
                  style: theme.textTheme.headlineLarge,
                ),
                Text(
                  localizations.headerRole,
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                if (PlatformHandler.compact(context)) ...{
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: PageView(
                        controller: widget.homeViewModel.pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          AboutMeCard(),
                          ExperienceCard(),
                          ToolsCard(listIcons: widget.homeViewModel.toolsIcons),
                        ],
                      ),
                    ),
                  ),
                } else ...{
                  SizedBox(
                    width: width * AppDimensions.cardWidthFactor,
                    height: height * AppDimensions.cardHeightFactor,
                    child: ListenableBuilder(
                      listenable: widget.homeViewModel,
                      builder: (context, child) => PageView(
                        controller: widget.homeViewModel.pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          AboutMeCard(),
                          ExperienceCard(),
                          ToolsCard(listIcons: widget.homeViewModel.toolsIcons),
                        ],
                      ),
                    ),
                  ),
                },
                if (PlatformHandler.isMobile ||
                    !PlatformHandler.compact(context))
                  PageIndicator(
                    tabController: widget.homeViewModel.tabController,
                    onUpdateCurrentPageIndex:
                        widget.homeViewModel.updateCurrentPageIndex,
                  ),
                if (!PlatformHandler.extraLarge(context))
                  ContactRow(homeViewModel: widget.homeViewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
