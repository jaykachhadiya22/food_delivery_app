import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppUtil{
  easyLoadingInit() {
    if (Platform.isAndroid) {
      EasyLoading.instance
        ..indicatorType = EasyLoadingIndicatorType.ring
        ..loadingStyle = EasyLoadingStyle.custom
        ..maskColor = Colors.black54
        ..maskType = EasyLoadingMaskType.custom
        ..backgroundColor = Colors.black  //ColorConfig.accentColor.withAlpha(1)
        ..textColor = Colors.white
        ..indicatorColor = Colors.white
        ..toastPosition = EasyLoadingToastPosition.bottom;
    } else {
      EasyLoading.instance
        ..indicatorType = EasyLoadingIndicatorType.circle
        ..loadingStyle = EasyLoadingStyle.custom
        ..maskColor = Colors.black54
        ..maskType = EasyLoadingMaskType.custom
        ..backgroundColor = Colors.black         //ColorConfig.accentColor.withAlpha(1)
        ..textColor = Colors.white
        ..indicatorColor = Colors.white
        ..toastPosition = EasyLoadingToastPosition.bottom;
    }
  }
}