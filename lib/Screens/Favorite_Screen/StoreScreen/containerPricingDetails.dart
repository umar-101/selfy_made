import 'package:Selfy_made/Screens/Order_Screen/orderDetails.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import 'package:sizer/sizer.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      height: 18.0.h,
      color: kWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Manzara Baskı Tablo 150x90',
                style: TextStyle(
                    fontSize: 16.0.sp,
                    color: kPrimaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.favorite_border,
                  color: kPrimaryTextColor, size: 18.0.sp),
              SizedBox(width: 5),
              Icon(Icons.star_border, color: kPrimaryTextColor, size: 20.0.sp),
            ],
          ),
          Row(
            children: [
              Text('5.00',
                  style: kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
              SizedBox(width: 5),
              RatingStar(),
              RatingStar(),
              RatingStar(),
              RatingStar(),
              RatingStar(),
            ],
          ),
          Text(
            '₺89.99',
            style: TextStyle(
                fontSize: 14.0.sp,
                color: kPrimaryTextColor,
                fontWeight: FontWeight.bold),
          ),
          Row(children: [
            Text(
              '₺100.95',
              style: TextStyle(
                fontSize: 13.0.sp,
                color: kPrimaryTextColor,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 10.0.w,
              height: 3.0.h,
              color: kPrimaryColor,
              child: Center(
                child: Text('-14%', style: kSmallTextWhite),
              ),
            )
          ])
        ],
      ),
    );
  }
}
