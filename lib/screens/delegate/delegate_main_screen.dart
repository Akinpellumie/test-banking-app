import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_banking_app/components/empty_list.dart';

import '../../database/delegate_database.dart';
import '../../model/delegate/delegate.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../utils/random_color.dart';
import '../../utils/security_tip_modal.dart';
import '../../utils/shared_prefs.dart';
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
    refreshDelegates();
    super.initState();
  }

  @override
  void dispose() {
    //DelegateDatabase.instance.close();
    super.dispose();
  }

  bool loading = false;
  late Delegate? delegateData;
  List<Delegate> delegateList = [];

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (delegateList.length >= 3) {
            displayToast(
              "You've reached the maximum number of delegate.",
              kPrimaryDarkColor,
            );
          } else {
            await AddDelegateModal.bottomModalPopup(context).then(
              (value) {
                setState(
                  () {
                    delegateData = value;
                    //loading = true;
                    addDelegate(value);
                    refreshDelegates();
                    //delegateList.add(value);
                  },
                );
              },
            );
          }
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
            Stack(
              children: [
                Positioned(
                  right: 0.0,
                  top: -30.0,
                  child: Opacity(
                    opacity: 0.08,
                    child: SvgPicture.asset(
                      "assets/images/floating.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
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
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Visibility(
                                  visible: delegateList.isNotEmpty,
                                  child: Column(
                                    children: [
                                      Text(
                                        "My Delegates",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                          fontFamily: kDefaultFont,
                                          fontSize: size.height * 0.019,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                                loading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : delegateList.isEmpty
                                        ? EmptyList(
                                            size: size,
                                            msg:
                                                'No delegate found. Click the "+" to get started.',
                                          )
                                        : ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(), // new
                                            controller: _controller,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                                  107,
                                                                  210,
                                                                  212,
                                                                  214)
                                                              .withOpacity(
                                                                  0.65),
                                                      spreadRadius: 0,
                                                      blurRadius: 8.0,
                                                      offset:
                                                          const Offset(0.5, 1),
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .only(
                                                          right:
                                                              kDefaultPadding /
                                                                  2),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      decoration: BoxDecoration(
                                                        color: randomColor(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Text(
                                                        getInitials(
                                                          delegateList[index]
                                                              .fullname,
                                                        ),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              kDefaultFont,
                                                          fontSize:
                                                              size.height *
                                                                  0.0200,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            delegateList[index]
                                                                .fullname,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  kDefaultFont,
                                                              fontSize:
                                                                  size.height *
                                                                      0.020,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          Text(
                                                            delegateList[index]
                                                                .email,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  kDefaultFont,
                                                              fontSize:
                                                                  size.height *
                                                                      0.014,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      formatAmountInNaira(
                                                        double.parse(
                                                            delegateList[index]
                                                                .maxAmount),
                                                      ),
                                                      style: TextStyle(
                                                        fontFamily:
                                                            kDefaultFont,
                                                        fontSize:
                                                            size.height * 0.014,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const SizedBox(
                                                height: 10.0,
                                              );
                                            },
                                            itemCount: delegateList.length,
                                          ),
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

  Future refreshDelegates() async {
    setState(() => loading = true);

    String userId = await SharedPrefs.getString('userID');
    delegateList = await DelegateDatabase.instance.readAllDelegates(userId);

    setState(() => loading = false);
  }

  Future addDelegate(Delegate delegate) async {
    await DelegateDatabase.instance.create(delegate);
  }
}
