import 'package:flutter/material.dart';
import 'package:mobile_banking_app/components/empty_list.dart';

import '../../model/delegate/delegate_model.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../utils/security_tip_modal.dart';
import '../../widgets/add_delegate_modal.dart';
import '../../widgets/custom_back_button.dart';

class DelegateMainScreen extends StatefulWidget {
  const DelegateMainScreen({Key? key}) : super(key: key);

  @override
  State<DelegateMainScreen> createState() => _DelegateMainScreenState();
}

class _DelegateMainScreenState extends State<DelegateMainScreen> {

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SecurityTipModal.securityTipPopup(
        context,
        'SECURITY TIPS',
        'Do not respond to emails that claim to be from Test Mobile Bank (or any other company) requesting your account details or login credentials (username/password). We will never ask for your personal information online.',
      );
    });
    super.initState();
  }
  
  String firstDelegate = '';
  String secondDelegate = '';
  String thirdDelegate = '';
  late DelegateModel? firstDelegateData;
  late DelegateModel? secondDelegateData;
  late DelegateModel? thirdDelegateData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await AddDelegateModal.bottomModalPopup(context).then((value) {
            setState(() {
              //var newValue = value as DelegateModel(f);
              firstDelegateData = value;
              firstDelegate = firstDelegateData == null
                  ? ''
                  : getInitials(
                      firstDelegateData!.firstName +
                          " " +
                          firstDelegateData!.lastName,
                    );
            });
          });
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Delegate",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "View and manage your added delegates with ease!",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.normal,
                      fontSize: size.height * 0.0170,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 100.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return SizedBox(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                EmptyList(
                                    size: size,
                                    msg:
                                        'No delegate found. Click the "+" to get started.')
                              ],
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
