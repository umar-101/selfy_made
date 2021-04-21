import 'package:Selfy_made/api_calls.dart';
import 'package:Selfy_made/const.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

import '../../CustomFlatButton.dart';
import 'profile.dart';
import 'package:sizer/sizer.dart';

class ConfirmPassword extends StatefulWidget {
    final String currentPassword;

  const ConfirmPassword({Key key, this.currentPassword}) : super(key: key);
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

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
              'Yeni şifrenizi girin',
              style: TextStyle(fontSize: 12.0.sp, color: kPrimaryTextColor),
            ),
            SizedBox(height: 4.0.h),
            TextField(
                    controller:newPasswordController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                hintText: "Yeni Şifre",
                fillColor: Color(0xFFF6F6F6),
              ),
            ),
            SizedBox(height: 3.0.h),
            Text(
              'Yeni şifrenizi tekrar girin',
              style: TextStyle(fontSize: 12.0.sp, color: kPrimaryTextColor),
            ),
            SizedBox(height: 4.0.h),
            TextField(
                    controller:confirmPasswordController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                hintText: "Yeni Şifre (Tekrar)",
                fillColor: Color(0xFFF6F6F6),
              ),
            ),
            SizedBox(height: 8.0.h),
            CustomFlatButton(
              width: 70.0.w,
              height: 7.0.h,
              title: 'Kaydet',
              onTap: () {
                _changePassword();
              },
            ),
          ],
        ),
      ),
    );
  }
  void _changePassword() async{
      var response = await ApiCalls().changePassword(widget.currentPassword,newPasswordController.text,confirmPasswordController.text);

      if(response == "success"){
          FlushbarHelper.createInformation(
                  message:"Password Succesfully Changed",
                  title:"Success",
                  duration:Duration(seconds:3),
          )..show(context);
          Future.delayed(Duration(seconds:5),
                  (){
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen()));
                  }
          );

      }else{
            Flushbar(
                    title:"Error",
                    message:response??"Something Went Wrong",
                    backgroundColor:Colors.red,
                    duration:Duration(seconds:5),
            )..show(context);

      }

  }
}
