import 'package:flutter/material.dart';
import 'package:mobile_banking_app/utils/constants.dart';

import '../model/bank/bank_model.dart';

class BankListModal {
  static showBankListPopup(BuildContext context, List<BankModel> bankList) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: size.height * 0.85,
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
                      color: kPrimaryColor,
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
                        color: kRedColor.withOpacity(0.8),
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(
                          0.65,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          bankList[index].bankName,
                          style: TextStyle(
                              color: kTextColor,
                              fontFamily: kDefaultFont,
                              fontWeight: FontWeight.w500,
                              fontSize: size.height * 0.0200),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10.0,
                    );
                  },
                  itemCount: bankList.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
