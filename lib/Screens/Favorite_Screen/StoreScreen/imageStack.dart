import 'package:flutter/material.dart';

import '../../../const.dart';
import 'package:sizer/sizer.dart';

class ImageStackContainer extends StatelessWidget {
  const ImageStackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: 100.0.w,
          height: 40.0.h,
          image: AssetImage('assets/images/store.jpg'),
        ),
        Positioned(
          top: 5.0.h,
          left: 5.0.w,
          child: Container(
            width: 88.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopButtonContainer(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 19.0.sp,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                Container(
                  width: 45,
                  height: 50,
                  child: Stack(
                    children: [
                      TopButtonContainer(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 17.0.sp,
                          color: kWhiteColor,
                        ),
                      ),
                      Positioned(
                        bottom: 35,
                        left: 22,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black87),
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: kMediumTextPrimary.copyWith(
                                  color: kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TopButtonContainer extends StatelessWidget {
  final Widget icon;
  const TopButtonContainer({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
        shape: BoxShape.circle,
        color: Color(0xFF939393),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
