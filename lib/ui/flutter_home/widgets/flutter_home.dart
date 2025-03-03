import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'widgets.dart';

class FlutterHome extends StatefulWidget {
  const FlutterHome({
    super.key,
    required this.viewModel,
  });

  final FlutterHomeViewModel viewModel;

  @override
  State<FlutterHome> createState() => _FlutterHomeState();
}

class _FlutterHomeState extends State<FlutterHome>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.viewModel.tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    widget.viewModel.pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.tabController.dispose();
    widget.viewModel.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: width * 0.18,
        leading: ContactRow(),
        actions: [ActionsRow(viewModel: widget.viewModel)],
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(Assets.me),
                radius: height * 0.15,
              ),
              Text(
                'Bruno Vieira',
                style: theme.textTheme.headlineLarge,
              ),
              Text(
                localizations.headerRole,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                width: width * 0.40,
                height: height * 0.25,
                child: ListenableBuilder(
                  listenable: widget.viewModel,
                  builder: (context, child) => PageView(
                    controller: widget.viewModel.pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      AboutMeCard(),
                      ExperienceCard(),
                      BaseCard(
                        backgroundColor: Color(0xFF622E9F),
                        child: Column(
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PageIndicator(
                tabController: widget.viewModel.tabController,
                currentPageIndex: widget.viewModel.tabController.index,
                onUpdateCurrentPageIndex:
                    widget.viewModel.updateCurrentPageIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
