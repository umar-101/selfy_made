import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Ayarlar', style: kMediumTextPrimary), //My Store
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.0.h),
            ProfileDetailsRow(
              title: 'Politikamız', //our Policy
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => CreateCoupoun()),
              //   );
              // },
            ),
            Divider(thickness: .3, height: 10, color: kPrimaryTextColor),
            SizedBox(height: 2.0.h),
            ProfileDetailsRow(
              title: 'Hakkımızda', // About us
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => MyCoupouns()),
              //   );
              // },
            ),
            Divider(thickness: .3, color: kPrimaryTextColor),
            SizedBox(height: 2.0.h),
            Text('Çıkış Yap', style: kSmallTextPrimary), // logOut
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
