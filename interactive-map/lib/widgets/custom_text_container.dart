import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    Key? key,
    required this.topic,
    required this.description,
  }) : super(key: key);

  final String topic;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 125,
      color: AppColors.fern,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            topic,
            style: const TextStyle(
              color: AppColors.sky,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.night,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
