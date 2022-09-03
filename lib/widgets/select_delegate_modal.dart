import 'package:flutter/material.dart';
import '../model/delegate/delegate.dart';
import '../utils/constants.dart';

class SelectDelegateModal {
  static bottomModalPopup(BuildContext context, List<Delegate> _delegates) {
    Size size = MediaQuery.of(context).size;
    List<Delegate> delegates = _delegates;
    final ScrollController _controller = ScrollController();
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: size.height * 0.80,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 5.0,
                    width: 50.0,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const Text(
                  "Select a Delegate!",
                  style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: kNormalText + 3),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // new
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.pop(context, delegates[index]),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              delegates[index].fullname,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: kDefaultFont,
                                fontWeight: FontWeight.normal,
                                fontSize: size.height * 0.019,
                              ),
                            ),
                            Text(
                              delegates[index].phoneNumber,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: kDefaultFont,
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * 0.017,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: kDarkGrayColor.withOpacity(0.15),
                          border: Border.all(color: kPrimaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10.0,
                    );
                  },
                  itemCount: delegates.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
