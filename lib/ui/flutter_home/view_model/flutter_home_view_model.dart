import 'package:flutter/material.dart';
import 'package:portfolio/config/app_config.dart';
import 'package:portfolio/config/assets.dart';
import 'package:portfolio/ui/core/theme/app_dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterHomeViewModel extends ChangeNotifier {
  late final TabController _tabController;
  late final PageController _pageController;

  TabController get tabController => _tabController;
  PageController get pageController => _pageController;

  void initControllers(TickerProvider vsync) {
    _tabController = TabController(
      length: 3,
      vsync: vsync,
      initialIndex: 0,
    );
    _pageController = PageController(initialPage: 0);
  }

  void disposeControllers() {
    _tabController.dispose();
    _pageController.dispose();
  }

  void updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageController.animateToPage(
      index,
      duration:
          Duration(milliseconds: AppDimensions.defaultAnimationDurationInMs),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  final List<String> toolsIcons = [
    Assets.flutter,
    Assets.dart,
    Assets.git,
    Assets.github,
    Assets.postman,
    Assets.codemagic,
    Assets.figma,
    Assets.gcp,
  ];

  Future<void> openWhatsApp() async {
    await launchUrl(Uri.parse(AppConfig.whatsappUrl));
  }

  Future<void> sendEmail(String role) async {
    await launchUrl(
      Uri(
        scheme: 'mailto',
        path: AppConfig.emailAddress,
        queryParameters: {'subject': '${role.trim()}❤️'},
      ),
    );
  }

  Future<void> openLinkedIn() async {
    await launchUrl(Uri.parse(AppConfig.linkedinUrl));
  }
}
