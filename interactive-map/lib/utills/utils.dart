import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class Utils {
  static double getVideoScreenWidth(Size screenSize) {
    if (screenSize.width / screenSize.height <
        VideoAspectRatio.width / VideoAspectRatio.height) {
      return VideoAspectRatio.width *
          (screenSize.height / VideoAspectRatio.height);
    } else {
      return screenSize.width;
    }
  }

  static double getVideoScreenHeight(Size screenSize) {
    if (screenSize.width / screenSize.height <
        VideoAspectRatio.width / VideoAspectRatio.height) {
      return screenSize.height;
    } else {
      return VideoAspectRatio.height *
          (screenSize.width / VideoAspectRatio.width);
    }
  }
}
