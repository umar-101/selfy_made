import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'searchScreen.dart';

class CategoriesSearch extends StatefulWidget {
  @override
  _CategoriesSearchState createState() => _CategoriesSearchState();
}

class _CategoriesSearchState extends State<CategoriesSearch> {
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
                  hintText: 'Mağazalar',
                  suffixIcon: Icon(
                    Icons.close,
                    size: 12.0.sp,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: DividerContainer(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            width: 70,
                            height: 80,
                            image: AssetImage('assets/images/store.jpg'),
                          ),
                        ),
                        SizedBox(width: 4.0.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Atatürk Tablosu (Ürün)',
                                style: kMediumTextPrimary.copyWith(
                                    fontSize: 12.0.sp),
                              ),
                              Text(
                                'Duis aute irure dolor in reprehenderit in voluptate',
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize: 10.0.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 4.0.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 55,
                            height: 30,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Detay',
                                style: TextStyle(
                                    color: kWhiteColor, fontSize: 11.0.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
