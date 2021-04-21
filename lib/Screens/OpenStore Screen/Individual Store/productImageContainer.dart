import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';

class ProductAddImageContainer extends StatelessWidget {
  const ProductAddImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 25.0.w,
            height: 14.0.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red)),
            child: Center(
                child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/Cart.png'),
            )),
          ),
          Positioned(
            top: 10.0.h,
            left: 18.0.w,
            child: CircleAvatar(
                radius: 3.5.w,
                backgroundColor: kPrimaryLightColor,
                child: Icon(
                  Icons.add,
                  size: 20.0.sp,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
