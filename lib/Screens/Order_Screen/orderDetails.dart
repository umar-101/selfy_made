import 'package:Selfy_made/Screens/Order_Screen/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'billCardContainer.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Sipariş Detayı', style: kMediumTextPrimary), //My Orders
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BarContainerRow(
              title: 'Sipariş Detayı',
            ),
            SizedBox(height: 3.0.h),
            BillCardContainer(),
            SizedBox(height: 3.0.h),
            BarContainerRow(
              title: 'Teslimat Adresi',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ev',
                        style: TextStyle(
                            color: Colors.grey[500], fontSize: 12.0.sp),
                      ),
                      Container(
                        width: 70.0.w,
                        child: Expanded(
                          child: Text(
                            'Pazariçi Mah. Şehnazdere Sk. No:27,Gazi Osman Paşa - İstanbul',
                            maxLines: 2,
                            style: TextStyle(fontSize: 11.0.sp, height: 1.5),
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.location_history, color: kPrimaryColor)
                ],
              ),
            ),
            BarContainerRow(
              title: 'Kargo',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aras Kargo - 112455',
                        style: TextStyle(
                            color: Colors.grey[500], fontSize: 12.0.sp),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Kargom Nerede?',
                        style: TextStyle(
                            fontSize: 11.0.sp,
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.location_history, color: kPrimaryColor)
                ],
              ),
            ),
            BarContainerRow(
              title: 'Yorumla ve Puan Ver',
            ),
            Row(
              children: [
                Text('Değerlendir'),
                Spacer(),
                RatingStar(),
                RatingStar(),
                RatingStar(),
                RatingStar(),
                RatingStar(),
              ],
            ),
            Container(
              width: double.infinity,
              height: 15.0.h,
              decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kNavBarIconsColor, width: 1)),
              // child: TextField(
              //   keyboardType: TextInputType.multiline,
              //   maxLines: null,
              //   decoration: InputDecoration(
              //     border:
              //   ),
              // )
            ),
          ]),
        ),
      ),
    );
  }
}

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 17,
      color: Color(0xFFF6BB42),
    );
  }
}

class BarContainerRow extends StatelessWidget {
  final String title;
  const BarContainerRow({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 0.7.w, height: 3.0.h, color: kPrimaryColor),
        SizedBox(width: 4.0.w),
        Text(title,
            style: kMediumTextPrimary.copyWith(
                color: kPrimaryTextColor, fontSize: 14.0.sp)),
      ],
    );
  }
}
