import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import '../helpers/theme_helper.dart';
import '../utils/constants.dart';
import '../view_models/delegate/delegate_modal_view_model.dart';
import 'app_button.dart';

class SelectDelegateModal {
  static bottomModalPopup(context) {
    Size size = MediaQuery.of(context).size;
    String firstDelegate = 'Akinlade Akinpelumi';
    String secondDelegate = 'Evong GodsFavour';
    String thirdDelegate = 'Henry Okpocha';
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        // final DelegateModalViewModel viewModel =
        //     Provider.of<DelegateModalViewModel>(bc);

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
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context, null);
                //   },
                //   child: Align(
                //       alignment: Alignment.centerRight,
                //       child: Icon(
                //         Icons.cancel,
                //         color: kSuccessColor.withOpacity(0.8),
                //         size: 25.0,
                //       )),
                // ),
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
                GestureDetector(
                  onTap: () => Navigator.pop(context, firstDelegate),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          firstDelegate,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.normal,
                            fontSize: kNormalText,
                          ),
                        ),
                        const Text(
                          '08109531155',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.w300,
                            fontSize: kNormalText - 5,
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
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context, secondDelegate),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          secondDelegate,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.normal,
                            fontSize: kNormalText,
                          ),
                        ),
                        const Text(
                          '08145336622',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.w300,
                            fontSize: kNormalText - 5,
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
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context, thirdDelegate),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          thirdDelegate,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.normal,
                            fontSize: kNormalText,
                          ),
                        ),
                        const Text(
                          '08097278292',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.w300,
                            fontSize: kNormalText - 5,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
