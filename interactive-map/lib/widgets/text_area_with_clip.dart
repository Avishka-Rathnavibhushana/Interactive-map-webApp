import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';
import 'package:interactive_map/widgets/textArea_text_Topic.dart';
import 'package:interactive_map/widgets/textArea_text_description.dart';
import 'package:interactive_map/widgets/textArea_text_row.dart';

class TextAreaWithClip extends StatelessWidget {
  const TextAreaWithClip({
    Key? key,
    required this.screenSize,
    required this.texts,
    required this.topic,
    required this.description,
  }) : super(key: key);

  final Size screenSize;
  final List<String> texts;
  final String topic;
  final String description;

  @override
  Widget build(BuildContext context) {
    print(screenSize.width);
    return CustomPaint(
      //size: Size(700, 700),
      painter: SqureShapedCustomContainer(),
      child: Container(
        // width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
        width: screenSize.width * 0.25 * Utils.getMultiplier(screenSize.width),
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * (35 / VideoAspectRatio.height),
          horizontal: screenSize.width * (30 / VideoAspectRatio.width),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topic == ''
                ? const SizedBox()
                : TextAreaTextTopic(
                    screenSize: screenSize,
                    text: topic,
                    fontSize: 21,
                  ),
            description == ''
                ? const SizedBox()
                : TextAreaTextDescription(
                    screenSize: screenSize,
                    text: description,
                    fontSize: 17,
                  ),
            description == ''
                ? const SizedBox()
                : SizedBox(
                    height: screenSize.height * (15 / VideoAspectRatio.height),
                  ),
            texts.isEmpty
                ? const SizedBox()
                : Container(
                    padding: EdgeInsets.only(
                      top: screenSize.height * (15 / VideoAspectRatio.height),
                      bottom:
                          screenSize.height * (15 / VideoAspectRatio.height),
                      left: screenSize.width * (15 / VideoAspectRatio.width),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: texts
                          .map<Widget>((text) => TextAreaTextRow(
                                screenSize: screenSize,
                                text: text,
                                fontSize: 18,
                              ))
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
