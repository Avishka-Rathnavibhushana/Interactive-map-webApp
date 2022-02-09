import 'package:flutter/material.dart';

class CustomContainerTextRow extends StatelessWidget {
  const CustomContainerTextRow({
    Key? key,
    required this.screenSize,
    required this.text,
  }) : super(key: key);

  final Size screenSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: screenSize.width * 0.3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Color(0xFFC9D429),
              size: 17,
            ),
            Container(
              width: screenSize.width * 0.01,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 17),
                maxLines: 10,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
