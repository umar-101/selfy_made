import 'package:flutter/material.dart';

import '../../const.dart';
import 'package:sizer/sizer.dart';

import '../../mainScreen.dart';

class TrendingScreen extends StatefulWidget {
  final String selected = 'first';
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              // _scaffoldKey.currentState.openDrawer();
              Scaffold.of(context).openDrawer();
            },
            child: Image(image: AssetImage('assets/icons/hamBurger.png'))),
        title: Text(
          'Trendler',
          style: TextStyle(
              fontSize: 20,
              color: kPrimaryTextColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          TopButtons(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/Cart.png')),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kartvizit 1000’li baskı\n0.3mmx12cmx8cm',
                          style:
                              TextStyle(color: kPrimaryTextColor, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(children: [
                              Text(
                                '1 Adet  XL   Yeşil',
                                style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text(
                                'İptal Et',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 13,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(height: 3),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(children: [
                              Text(
                                'Ücretsiz Kargo',
                                style: TextStyle(
                                    color: kPrimaryTextColor, fontSize: 12),
                              ),
                              Spacer(),
                              Text(
                                '17.11.2020',
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(height: 3),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(children: [
                              Text(
                                '100₺',
                                style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text(
                                'Kargo Bilgisini Gir',
                                style: kSmallTextPrimary.copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopButtons extends StatefulWidget {
  const TopButtons({
    Key key,
  }) : super(key: key);

  @override
  _TopButtonsState createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  String selected = "first";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10.0.h,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey[200],
            blurRadius: 5,
            spreadRadius: 3,
            offset: Offset(0, 1))
      ]),
      child: Center(
        child: Container(
          width: 50.0.w,
          height: 6.0.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kNavBarIconsColor, width: 0.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                    setState(() {
                      selected = "first";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selected == "first" ? kPrimaryColor : kWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Günlük',
                        style: TextStyle(
                          color: selected == "first"
                              ? kWhiteColor
                              : kPrimaryTextColor,
                          fontSize: 11.0.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = "second";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selected == "second" ? kPrimaryColor : kWhiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Haftalık',
                        style: TextStyle(
                          color: selected == "second"
                              ? kWhiteColor
                              : kPrimaryTextColor,
                          fontSize: 11.0.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
