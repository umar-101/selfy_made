import 'package:Selfy_made/Screens/Chat%20Screen/chatScreen.dart';
import 'package:Selfy_made/Screens/Home%20Screen/data.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'alertDialog_Buttons.dart';
import 'containerPricingDetails.dart';
import 'expand_widgets.dart';
import 'imageStack.dart';
import 'storeData.dart';
import 'store_Page.dart';

class StoreDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageStackContainer(),
            Container(
              width: double.infinity,
              child: Expanded(
                child: Column(
                  children: [
                    TopContainer(),
                    AlertDialogs(),
                    FlatButtons(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(children: [
                        StoreExpandPanel(
                          title: articles[0].title,
                          body: articles[0].body,
                        ),
                        StoreExpandPanel(
                          title: articles[1].title,
                          body: articles[1].body,
                        ),
                        StoreExpandPanel(
                          title: articles[2].title,
                          body: articles[2].body,
                        ),
                        StoreExpandPanel(
                          title: articles[2].title,
                          body: articles[2].body,
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: double.infinity,
                      color: Color(0xFFF2F2F5),
                      height: 80.0.h,
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 10,
                          childAspectRatio: .83,
                        ),
                        itemBuilder: (context, index) {
                          return Expanded(
                            child: Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                        fit: BoxFit.fill,
                                        width: 200,
                                        height: 140,
                                        image: AssetImage(
                                          products[index].imageUrl,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 7, left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            products[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            softWrap: false,
                                            style: TextStyle(
                                                color: kPrimaryTextColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star_border, size: 26),
                                          Spacer(),
                                          Icon(Icons.favorite_border, size: 25),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            radius: 10.0.w,
                            child: Image(
                                image:
                                    AssetImage('assets/images/Profile.png'))),
                        SizedBox(height: 2.0.h),
                        Text(
                          'Jane Doe',
                          style: kMediumTextPrimary.copyWith(
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    BottomRow(
                      iconUrl: 'assets/icons/store.png',
                      title: 'Mağazayı Ziyaret Et',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StorePage()),
                        );
                      },
                    ),
                    BottomRow(
                      iconUrl: 'assets/icons/chat.png',
                      title: 'Satıcıya Soru Sor',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomRow extends StatelessWidget {
  final String title;
  final String iconUrl;
  final Function onTap;
  const BottomRow({
    Key key,
    this.title,
    this.iconUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(children: [
          Image(color: kPrimaryColor, image: AssetImage(iconUrl)),
          SizedBox(width: 5.0.w),
          Text(
            title,
            style: kMediumTextPrimary.copyWith(fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 12.0.sp, color: kNavBarIconsColor)
        ]),
      ),
    );
  }
}
