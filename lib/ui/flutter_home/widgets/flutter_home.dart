import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';
import 'package:portfolio/ui/flutter_home/widgets/actions_row.dart';
import 'package:portfolio/ui/flutter_home/widgets/base_card.dart';
import 'package:portfolio/ui/flutter_home/widgets/contact_row.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:portfolio/ui/flutter_home/widgets/page_indicator.dart';

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
                      BaseCard(
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
                            Center(
                              heightFactor: 1.5,
                              child: Text(
                                localizations.aboutMeCardText,
                                style: theme.textTheme.labelSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BaseCard(
                        backgroundColor: Color(0xFFD0670B),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  localizations.experienceCardTitle,
                                  style: theme.textTheme.labelSmall,
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.info,
                                    color: theme.iconTheme.color,
                                  ),
                                ),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     Text('Role'),
                            //     Text('Enterprise'),
                            //     Text('Start-End Date'),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
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
