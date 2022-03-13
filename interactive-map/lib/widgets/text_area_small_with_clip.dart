import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';

class TextAreaSmallWithClip extends StatelessWidget {
  const TextAreaSmallWithClip({
    Key? key,
    required this.screenSize,
    required this.width,
    required this.prefixText,
    required this.description,
  }) : super(key: key);

  final Size screenSize;
  final String prefixText;
  final String description;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //size: Size(700, 700),
      painter: SqureShapedCustomContainer(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        //alignment: Alignment.centerLeft,
        transformAlignment: Alignment.centerLeft,
        width: width * Utils.getMultiplier(screenSize.width),
        padding: EdgeInsets.symmetric(
          vertical: screenSize.width * (30 / VideoAspectRatio.height),
          horizontal: screenSize.height * (25 / VideoAspectRatio.width),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              prefixText,
              style: TextStyle(
                color: AppColors.fern,
                fontSize: 55 *
                    (screenSize.width / VideoAspectRatio.width) *
                    Utils.getMultiplier(screenSize.width),
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.extraBold,
              ),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: const VerticalDivider(
                color: AppColors.fern,
                thickness: 2,
              ),
            ),
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 25 *
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
      ),
    );
  }
}
