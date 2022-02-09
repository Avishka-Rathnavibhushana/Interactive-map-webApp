import 'package:flutter/material.dart';
import 'package:interactive_map/widgets/custom_container_text_row.dart';

Widget textArea(context, texts) {
  var screenSize = MediaQuery.of(context).size;
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: const Color(0xFF131438),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: texts
                .map<Widget>((text) => CustomContainerTextRow(
                      screenSize: screenSize,
                      text: text,
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
