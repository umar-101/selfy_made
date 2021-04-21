import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../const.dart';

import 'package:sizer/sizer.dart';

class InstagramShare extends StatefulWidget {
  @override
  _InstagramShareState createState() => _InstagramShareState();
}

class _InstagramShareState extends State<InstagramShare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [kPrimaryColor, Color(0xFFAED8D8)])),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 15.0.w),
                  Container(
                    height: 7.0.h,
                    width: 12.0.w,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.white54,
                        spreadRadius: 30,
                        blurRadius: 40,
                      )
                    ]),
                  ),
                  SizedBox(width: 10.0.w),
                  Image(
                      image: AssetImage('assets/images/app logo.png'),
                      width: 33.0.w,
                      height: 33.0.w),
                ],
              ),
              SizedBox(height: 6.0.h),
              StoreImageContainer(),
              RichText(
                text: TextSpan(
                  text: 'SELFY',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 22.0.sp,
                      letterSpacing: 5),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'MADE',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 22.0.sp,
                          letterSpacing: 5),
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.appStore),
                    onPressed: () {},
                    iconSize: 20.0.sp,
                    color: kWhiteColor,
                  ),
                  Text(
                    'App Store',
                    style: TextStyle(color: kWhiteColor, fontSize: 13.0.sp),
                  ),
                  SizedBox(width: 7.0.w),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.googlePlay),
                    onPressed: () {},
                    iconSize: 20.0.sp,
                    color: kWhiteColor,
                  ),
                  Text(
                    'Play Store',
                    style: TextStyle(color: kWhiteColor, fontSize: 13.0.sp),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
                child: Container(
                  width: double.infinity,
                  height: 6.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kBlackColor,
                  ),
                  child: Center(
                    child: Text(
                      'Instagram\'da Paylaş ',
                      style: TextStyle(color: kWhiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
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
      height: 30.0.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Positioned(
              bottom: 6.0.h,
              left: 3.0.w,
              child: Container(
                width: 80.0.w,
                height: 18.0.h,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
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
                        SizedBox(width: 1.0.w),
                        Text('Cali, California',
                            style: TextStyle(color: kPrimaryTextColor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 19.0.w,
                height: 12.0.h,
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
