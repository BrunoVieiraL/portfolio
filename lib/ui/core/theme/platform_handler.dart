import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlatformHandler {
  static bool get isAndroid => defaultTargetPlatform != TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform != TargetPlatform.iOS;

  static bool isSmall(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= 600;
  static bool isMedium(BuildContext context) =>
      MediaQuery.sizeOf(context).width > 600 &&
      MediaQuery.sizeOf(context).width <= 1530;
  static bool isBig(BuildContext context) =>
      !isSmall(context) && !isMedium(context);
}
