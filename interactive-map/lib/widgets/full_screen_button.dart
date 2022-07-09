import 'dart:html';

import 'package:flutter/material.dart';

class FullScreenButton extends StatelessWidget {
  const FullScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () {
          document.documentElement?.requestFullscreen();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 10,
          ),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.fullscreen_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
