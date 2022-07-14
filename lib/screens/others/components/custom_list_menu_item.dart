import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CustomListMenuItem extends StatelessWidget {
  const CustomListMenuItem({
    Key? key,
    required this.title,
    required this.pressed,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback pressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    //import viewmodel into the design

    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: kFrameDefaultHeight,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: kDarkGrayColor.withOpacity(0.15),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: kPrimaryColor, width: 1.0),
        ),
        child: Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(iconData)),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: kSubTitleText - 5,
                  fontWeight: FontWeight.w400,
                  fontFamily: kDefaultFont,
                ),
              ),
            ),
            const Icon(Icons.chevron_right,
                color: kTextColor, size: kDefaultPadding + 10.0),
          ],
        ),
      ),
    );
  }
}
