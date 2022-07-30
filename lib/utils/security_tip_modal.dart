import 'package:flutter/material.dart';

import 'constants.dart';

class SecurityTipModal {
  static void securityTipPopup(
      BuildContext context, String title, String message) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: size.height * 0.35,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 5.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kPrimaryDarkColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.cancel,
                            color: kSuccessColor.withOpacity(0.8),
                            size: 25.0,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: kTextColor,
                        fontFamily: kDefaultFont,
                        fontWeight: FontWeight.w500,
                        fontSize: size.height * 0.0200),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                          color: kTextColor,
                          fontFamily: kDefaultFont,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.0170),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
