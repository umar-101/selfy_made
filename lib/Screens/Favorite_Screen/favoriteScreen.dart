import 'package:Selfy_made/Screens/Home%20Screen/appBarWithDrawer.dart';
import 'package:Selfy_made/Screens/Home%20Screen/data.dart';
import 'package:Selfy_made/Screens/Order_Screen/orderDetails.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'StoreScreen/store_detail.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String selected = 'first';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MainAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ProfileScreen()),
                    // );
                    setState(() {
                      selected = 'first';
                    });
                  },
                  child: Column(
                    children: [
                      (Text('Mağazalar',
                          style: TextStyle(
                              fontSize: 11.0.sp,
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.w500))),
                      SizedBox(height: 4),
                      Container(
                          width: 100,
                          height: 4,
                          color: selected == 'first'
                              ? kPrimaryColor
                              : kScaffoldColor)
                    ],
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ProfileScreen()),
                    // );
                    setState(() {
                      selected = 'second';
                    });
                  },
                  child: Column(
                    children: [
                      Text('Takip Ettiklerin',
                          style: TextStyle(
                              fontSize: 15,
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 4),
                      Container(
                          width: 100,
                          height: 4,
                          color: selected == 'second'
                              ? kPrimaryColor
                              : kScaffoldColor)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            selected == 'second'
                ? Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoreDetail()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
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
                                            Icon(Icons.favorite_border,
                                                size: 25),
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
                    ),
                  )
                : StoreImageContainer(),
          ],
        ),
      ),
    );
  }
}

class StoreImageContainer extends StatelessWidget {
  const StoreImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35.0.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                width: 75.0.w,
                height: 25.0.h,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          spreadRadius: 5,
                          blurRadius: 3,
                          offset: Offset(0.1, 1))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 6.0.h),
                    Text('Jane Doe',
                        style: kMediumTextPrimary.copyWith(
                            color: kPrimaryTextColor)),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/location.png'),
                        ),
                        SizedBox(width: 2.0.w),
                        Text('Cali, California',
                            style: TextStyle(color: kPrimaryTextColor)),
                        SizedBox(width: 4.0.w),
                        CircleAvatar(
                          radius: 1.0.w,
                          backgroundColor: kPrimaryColor,
                        ),
                        SizedBox(width: 2.0.w),
                        Text('792 Satış',
                            style: TextStyle(color: kPrimaryTextColor)),
                      ],
                    ),
                    SizedBox(height: 1.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('5.0', style: TextStyle(color: kPrimaryTextColor)),
                        SizedBox(width: 2.0.w),
                        RatingStar(),
                        RatingStar(),
                        RatingStar(),
                        RatingStar(),
                        RatingStar(),
                        SizedBox(width: 2.0.w),
                        Text('(37)',
                            style: TextStyle(color: kPrimaryTextColor)),
                      ],
                    ),
                    SizedBox(height: 1.0.h),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30.0.w,
                        height: 5.0.h,
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            'Takibi Bırak',
                            style:
                                kSmallTextPrimary.copyWith(color: kWhiteColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 11.0.h,
                height: 11.5.h,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: kWhiteColor)),
                child: Image(image: AssetImage('assets/images/Cart.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
