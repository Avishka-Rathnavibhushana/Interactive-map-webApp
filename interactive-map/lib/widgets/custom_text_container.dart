import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    Key? key,
    required this.screenSize,
    required this.topic,
    required this.description,
  }) : super(key: key);

  final String topic;
  final String description;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width *
          0.08 *
          (screenSize.width / VideoAspectRatio.width) *
          Utils.getCustomTextContainerMultiplier(screenSize.width),
      height: 125 * (screenSize.height / VideoAspectRatio.height),
      color: AppColors.fern,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            topic,
            style: GoogleFonts.barlow(
              textStyle: TextStyle(
              color: AppColors.sky,
              fontSize: 18 *
                  (screenSize.width / VideoAspectRatio.width) *
                  Utils.getMultiplier(screenSize.width),
              fontWeight: FontWeight.w600,
              ),
            ),
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10 * (screenSize.height / VideoAspectRatio.height),
          ),
          Text(
            description,
            style: GoogleFonts.barlow(
              textStyle: TextStyle(
              color: AppColors.night,
              fontSize: 14 *
                  (screenSize.width / VideoAspectRatio.width) *
                  Utils.getMultiplier(screenSize.width),
              fontWeight: FontWeight.w600,
              ),
            ),
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
