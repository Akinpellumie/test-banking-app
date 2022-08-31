import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_banking_app/utils/assets_path.dart';

import '../utils/constants.dart';

class EmptyList extends StatelessWidget {
  final String msg;
  final Size size;
  const EmptyList({Key? key, required this.msg, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 40.0,
          ),
          SvgPicture.asset(
            AssetsPath.empty,
            height: size.height * 0.25,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColor.withOpacity(0.85),
                fontSize: size.height * 0.025,
                fontFamily: kDefaultFont,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
