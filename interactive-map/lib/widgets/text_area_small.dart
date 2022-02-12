import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class TextAreaSmall extends StatelessWidget {
  const TextAreaSmall({
    Key? key,
    required this.screenSize,
    required this.prefixText,
    required this.description,
  }) : super(key: key);

  final Size screenSize;
  final String prefixText;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.25,
      decoration: const BoxDecoration(
        color: AppColors.night,
      ),
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
    );
  }
}
