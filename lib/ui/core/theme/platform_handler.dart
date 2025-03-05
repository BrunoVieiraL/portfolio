import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlatformHandler {
  static bool get isAndroid => defaultTargetPlatform != TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform != TargetPlatform.iOS;

  static bool compact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;
  static bool extraLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1600;
}
