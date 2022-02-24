import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
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
        width: width < 370 ? 370 : width,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 25,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              prefixText,
              style: const TextStyle(
                color: AppColors.fern,
                fontSize: 55,
                fontWeight: FontWeight.bold,
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
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
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
