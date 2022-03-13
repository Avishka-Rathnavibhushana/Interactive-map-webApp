import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';

class TextAreaTextRow extends StatelessWidget {
  const TextAreaTextRow({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  final Size screenSize;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenSize.height * (15 / VideoAspectRatio.height)),
      //width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
      width: screenSize.width * 0.25 * Utils.getMultiplier(screenSize.width),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: AppColors.fern,
            size: screenSize.height * (17 / VideoAspectRatio.height),
          ),
          Container(
            width: screenSize.width *
                0.01 *
                (screenSize.width / VideoAspectRatio.width),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontSize *
                    (screenSize.width / VideoAspectRatio.width) *
                    Utils.getMultiplier(screenSize.width),
                fontFamily: Fonts.regular,
              ),
              maxLines: 10,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
