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

  static double getMultiplier(double width) {
    if (width < 500) {
      return 3;
    } else if (width < 1000) {
      return 1.5;
    } else {
      return 1;
    }
  }

  static double getCustomTextContainerMultiplier(double width) {
    if (width < 500) {
      return 3;
    } else if (width < 800) {
      return 4;
    } else if (width < 1000) {
      return 2.5;
    } else if (width < 1400) {
      return 1.5;
    } else {
      return 1;
    }
  }

  static double getBottomPadding(Size screenSize, double padding) {
    double transformedPadding =
        padding * (screenSize.height / VideoAspectRatio.height);
    if (screenSize.height < 500 && screenSize.width < 500) {
      return screenSize.height * 0.3 + transformedPadding;
    }
    if (screenSize.height < 500) {
      return transformedPadding;
    }
    if (screenSize.width < 500) {
      return screenSize.width * 0.3 + transformedPadding;
    } else {
      return transformedPadding - transformedPadding * 0.5;
    }
  }

  static double getRightPadding(Size screenSize, double padding) {
    double transformedPadding =
        padding * (screenSize.width / VideoAspectRatio.width);
    if (screenSize.height < 500 && screenSize.width < 500) {
      return transformedPadding;
    }
    if (screenSize.height < 500) {
      return screenSize.width * 0.3 + transformedPadding;
    }
    if (screenSize.width < 500) {
      return transformedPadding;
    } else {
      return transformedPadding;
    }
  }

  static double getTopPadding(Size screenSize, double padding) {
    double transformedPadding =
        padding * (screenSize.height / VideoAspectRatio.height);
    return transformedPadding;
  }
}
