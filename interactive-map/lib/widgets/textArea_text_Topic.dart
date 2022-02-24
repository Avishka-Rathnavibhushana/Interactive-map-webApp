import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class TextAreaTextTopic extends StatelessWidget {
  const TextAreaTextTopic({
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
      padding: const EdgeInsets.only(bottom: 15),
      width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.fern,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
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
