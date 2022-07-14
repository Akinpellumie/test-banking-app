import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BoxMenu extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color frameColor;
  const BoxMenu({
    Key? key,
    required this.title,
    required this.iconData,
    required this.frameColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            border: Border.all(color: frameColor, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: frameColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(169, 176, 185, 0.42),
                  spreadRadius: 0,
                  blurRadius: 8.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              iconData,
              size: 30.0,
              color: kWhiteColor,
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(title)
      ],
    );
  }
}
