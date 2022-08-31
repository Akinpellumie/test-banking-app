import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 55.0,
      width: size.width,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            offset: const Offset(0, 10),
            color: kPrimaryColor.withOpacity(0.10),
          ),
        ],
        border: Border.all(color: kCardBorderColor, width: 2.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(right: 5.0),
              child: const Icon(Icons.search_outlined)),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Search delegate',
                hintStyle: TextStyle(
                  color: kPrimaryColor.withOpacity(0.5),
                  fontFamily: kDefaultFont,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
