import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 15),
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.add,
            color: AppColors.fern,
            size: 17,
          ),
          Container(
            width: screenSize.width * 0.01,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontSize,
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
