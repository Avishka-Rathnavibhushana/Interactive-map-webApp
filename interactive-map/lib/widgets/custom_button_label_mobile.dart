import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class CustomButtonLabelMobile extends StatelessWidget {
  const CustomButtonLabelMobile({
    Key? key,
    required this.width,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.night),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontFamily: Fonts.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
