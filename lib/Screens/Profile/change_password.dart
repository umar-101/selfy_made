import 'package:Selfy_made/Screens/Profile/confirmPassword.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

import '../../CustomFlatButton.dart';
import 'profile.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
    final currentPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Şifre Değiştirme',
              style: kMediumTextPrimary.copyWith(
                  color: kPrimaryColor, fontSize: 17)),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
              size: 18.0.sp,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mevcut Şifrenizi girin',
              style: TextStyle(fontSize: 12.0.sp, color: kPrimaryTextColor),
            ),
            SizedBox(height: 7.0.h),
            TextField(
                    obscureText:true,
                    decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                    ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            hintText: "Current Password",
                            fillColor: Color(0xFFF6F6F6),
                    ),
                    controller:currentPasswordController
            ),
            SizedBox(height: 10.0.h),
            CustomFlatButton(
              width: 70.0.w,
              height: 7.0.h,
              title: 'Devam',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmPassword(currentPassword:currentPasswordController.text)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
