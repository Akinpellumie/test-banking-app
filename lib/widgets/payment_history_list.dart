import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/random_color.dart';

class PaymentHistoryList extends StatelessWidget {
  const PaymentHistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(169, 176, 185, 0.42),
                spreadRadius: 0,
                blurRadius: 8.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: kDefaultPadding / 2),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.send_rounded,
                  color: kWhiteColor,
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Payment title',
                      style: TextStyle(
                          fontSize: kSubTitleText - 7,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'payment description',
                      style: TextStyle(
                          fontSize: kNormalText - 2,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    '-N 1,000.00',
                    style: TextStyle(
                        color: kRedColor,
                        fontSize: kSubTitleText - 7,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '12/05/2022',
                    style: TextStyle(
                        fontSize: kNormalText - 5, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(169, 176, 185, 0.42),
                spreadRadius: 0,
                blurRadius: 8.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: kDefaultPadding / 2),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.style_outlined,
                  color: kWhiteColor,
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Payment title',
                      style: TextStyle(
                          fontSize: kSubTitleText - 7,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'payment description',
                      style: TextStyle(
                          fontSize: kNormalText - 2,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'N 500.00',
                    style: TextStyle(
                        color: kSuccessColor,
                        fontSize: kSubTitleText - 7,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '11/05/2022',
                    style: TextStyle(
                        fontSize: kNormalText - 5, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(169, 176, 185, 0.42),
                spreadRadius: 0,
                blurRadius: 8.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: kDefaultPadding / 2),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.style_outlined,
                  color: kWhiteColor,
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Payment title',
                      style: TextStyle(
                          fontSize: kSubTitleText - 7,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'payment description',
                      style: TextStyle(
                          fontSize: kNormalText - 2,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'N 500.00',
                    style: TextStyle(
                        color: kSuccessColor,
                        fontSize: kSubTitleText - 7,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '11/05/2022',
                    style: TextStyle(
                        fontSize: kNormalText - 5, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(169, 176, 185, 0.42),
                spreadRadius: 0,
                blurRadius: 8.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: kDefaultPadding / 2),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.style_outlined,
                  color: kWhiteColor,
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Payment title',
                      style: TextStyle(
                          fontSize: kSubTitleText - 7,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'payment description',
                      style: TextStyle(
                          fontSize: kNormalText - 2,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'N 500.00',
                    style: TextStyle(
                        color: kSuccessColor,
                        fontSize: kSubTitleText - 7,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '11/05/2022',
                    style: TextStyle(
                        fontSize: kNormalText - 5, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(169, 176, 185, 0.42),
                spreadRadius: 0,
                blurRadius: 8.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: kDefaultPadding / 2),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.style_outlined,
                  color: kWhiteColor,
                  size: 30.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Payment title',
                      style: TextStyle(
                          fontSize: kSubTitleText - 7,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'payment description',
                      style: TextStyle(
                          fontSize: kNormalText - 2,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'N 500.00',
                    style: TextStyle(
                        color: kSuccessColor,
                        fontSize: kSubTitleText - 7,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '11/05/2022',
                    style: TextStyle(
                        fontSize: kNormalText - 5, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
