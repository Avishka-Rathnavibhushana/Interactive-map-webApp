import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class TextAreaTextDescription extends StatelessWidget {
  const TextAreaTextDescription({
    Key? key,
    required this.screenSize,
    required this.text,
  }) : super(key: key);

  final Size screenSize;
  final String text;

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
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
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
