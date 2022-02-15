import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
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
    return CustomPaint(
      //size: Size(700, 700),
      painter: SqureShapedCustomContainer(),
      child: Container(
        width: screenSize.width * 0.25,
        padding: const EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topic == ''
                ? const SizedBox()
                : TextAreaTextTopic(
                    screenSize: screenSize,
                    text: topic,
                    fontSize: 25,
                  ),
            description == ''
                ? const SizedBox()
                : TextAreaTextDescription(
                    screenSize: screenSize,
                    text: description,
                    fontSize: 23,
                  ),
            topic == ''
                ? const SizedBox()
                : const SizedBox(
                    height: 15,
                  ),
            texts.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: 15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: texts
                          .map<Widget>((text) => TextAreaTextRow(
                                screenSize: screenSize,
                                text: text,
                                fontSize: 22,
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
