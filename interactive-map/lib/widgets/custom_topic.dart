import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class CustomTopic extends StatelessWidget {
  const CustomTopic({
    Key? key,
    required this.topic,
    required this.subTopic,
  }) : super(key: key);

  final String topic;
  final String subTopic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            topic,
            style: const TextStyle(
              color: AppColors.night,
              fontSize: 35,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              fontFamily: Fonts.regular,
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            subTopic,
            style: const TextStyle(
              color: AppColors.sea,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: Fonts.bold,
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
