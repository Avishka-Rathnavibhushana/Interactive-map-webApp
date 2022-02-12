import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class TextAreaWithQR extends StatelessWidget {
  const TextAreaWithQR({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  final String qr_url = 'assets/images/QR.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.night,
      ),
      padding: const EdgeInsets.all(
        35,
      ),
      child: Container(
        width: screenSize.width * 0.2,
        height: screenSize.width * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(qr_url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
