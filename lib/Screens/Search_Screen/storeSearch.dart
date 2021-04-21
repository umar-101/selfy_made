import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class StoreSearch extends StatefulWidget {
  @override
  _StoreSearchState createState() => _StoreSearchState();
}

class _StoreSearchState extends State<StoreSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Column(
        children: [
          Container(
            height: 6.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFF0F1F5),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kBlackColor,
              ),
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 16.0.sp),
                  border: InputBorder.none,
                  hintText: 'Ürünler',
                  suffixIcon: Icon(
                    Icons.close,
                    size: 12.0.sp,
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
