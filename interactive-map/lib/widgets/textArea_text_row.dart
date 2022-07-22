import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';

class TextAreaTextRow extends StatelessWidget {
  const TextAreaTextRow({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.fontSize,
    this.ratio = 0.30,
  }) : super(key: key);

  final Size screenSize;
  final String text;
  final double fontSize;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Utils.getTextPaddingRatio(screenSize.width) *
              screenSize.height *
              (25 / VideoAspectRatio.height)),
      //width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
      width: screenSize.width * ratio * Utils.getMultiplier(screenSize.width),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Utils.getIconTopPaddingRatio(screenSize.width) * 5),
            child: Icon(
              Icons.add,
              color: AppColors.fern,
              size: Utils.getIconResizeRatio(screenSize.width) *
                  screenSize.height *
                  (25 / VideoAspectRatio.height),
            ),
          ),
          Container(
            width: screenSize.width *
                0.01 *
                (screenSize.width / VideoAspectRatio.width),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.barlow(
                textStyle: TextStyle(
                color: AppColors.white,
                fontSize: fontSize *
                    (screenSize.width / VideoAspectRatio.width) *
                    Utils.getMultiplier(screenSize.width),
                ),
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
