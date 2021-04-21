import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class ProfileAndBackImageContainer extends StatelessWidget {
  const ProfileAndBackImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image(
            fit: BoxFit.fill,
            width: double.infinity,
            image: AssetImage('assets/images/storeBack.png'),
          ),
          Positioned(
            top: 4.0.h,
            left: 48.0.w,
            child: CircleAvatar(
                radius: 3.5.w,
                backgroundColor: kPrimaryLightColor,
                child: Icon(
                  Icons.add,
                  size: 20.0.sp,
                  color: Colors.white,
                )),
          ),
          Positioned(
            top: 10.0.h,
            left: 25.0.w,
            child: Container(
              child: Column(
                children: [
                  ProfileImageAdd(),
                  SizedBox(height: 15),
                  Text(
                    'Jane Doe',
                    style: TextStyle(
                        fontSize: 15.0.sp,
                        color: kPrimaryTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 1.0.h),
                  Row(
                    children: [
                      Image(image: AssetImage('assets/icons/location.png')),
                      SizedBox(width: 1.0.w),
                      Text(
                        'Cali,California',
                        style: TextStyle(
                            color: kPrimaryTextColor, fontSize: 11.0.sp),
                      ),
                      SizedBox(width: 1.0.w),
                      CircleAvatar(
                        radius: 1.0.w,
                        backgroundColor: kPrimaryColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '792 Satış',
                        style: TextStyle(
                            color: kPrimaryTextColor, fontSize: 11.0.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImageAdd extends StatelessWidget {
  const ProfileImageAdd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 23.0.w,
        child: Stack(
          children: [
            CircleAvatar(
                radius: 10.0.w,
                child: Image(
                    width: 25.0.w,
                    height: 25.0.h,
                    image: AssetImage('assets/images/Profile.png'))),
            Positioned(
              left: 14.0.w,
              bottom: 0,
              child: CircleAvatar(
                  radius: 3.5.w,
                  backgroundColor: kPrimaryLightColor,
                  child: Icon(
                    Icons.add,
                    size: 22.0.sp,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
