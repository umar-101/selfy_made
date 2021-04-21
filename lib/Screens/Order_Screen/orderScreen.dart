import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'orderDetails.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Siparişlerim', style: kMediumTextPrimary), //My Orders
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: CategoryBuilder(),
    );
  }
}

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({
    Key key,
  }) : super(key: key);

  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  final List<String> items = [
    'Tümü',
    'Tamamlananlar',
    'Bekleyenler',
    'İptal edildi',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.0.h),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 6.0.h,
          color: kWhiteColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                      child: Column(
                    children: [
                      Text(
                        items[index],
                        style: selectedIndex == index
                            ? kSmallTextPrimary
                            : kSmallTextPrimary.copyWith(
                                color: kNavBarIconsColor),
                      ),
                      Spacer(),
                      Container(
                        width: 20.0.w,
                        height: 0.5.h,
                        color: selectedIndex == index
                            ? kPrimaryColor
                            : Colors.white,
                      )
                    ],
                  )),
                ),
              );
            },
          ),
        ),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetails()),
                            );
                          },
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
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 12),
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
    );
  }
}
