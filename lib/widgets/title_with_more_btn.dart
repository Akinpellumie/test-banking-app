import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'title_with_underline.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        children: <Widget>[
          // ignore: prefer_const_constructors
          TitleWithUnderline(text: title),
          const Spacer(),
          TextButton(
            onPressed: press,
            child: const Text(
              "More",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              primary: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
