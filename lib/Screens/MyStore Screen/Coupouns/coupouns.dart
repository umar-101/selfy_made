import 'package:Selfy_made/Screens/MyStore%20Screen/Coupouns/myCoupouns.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';
import 'createCoupoun.dart';

class Coupouns extends StatefulWidget {
  @override
  _CoupounsState createState() => _CoupounsState();
}

class _CoupounsState extends State<Coupouns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Kuponlar', style: kMediumTextPrimary), //My Store
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyStoreScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            ProfileDetailsRow(
              title: 'Kupon Oluştur',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateCoupoun()),
                );
              },
            ),
            SizedBox(height: 2.0.h),
            Divider(thickness: .3, color: kPrimaryTextColor),
            ProfileDetailsRow(
              title: 'Kuponlarım',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCoupouns()),
                );
              },
            ),
            SizedBox(height: 2.0.h),
            Divider(thickness: .3, color: kPrimaryTextColor),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsRow extends StatelessWidget {
  final String title;
  final Function onTap;

  const ProfileDetailsRow({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        Text(
          title,
          style: kSmallTextPrimary,
        ),
        Spacer(),
        (Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryTextColor)),
      ]),
    );
  }
}
