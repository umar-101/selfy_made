import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/Screens/Profile/profile.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:flutter/material.dart';

import '../../const.dart';
import 'package:sizer/sizer.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
    var username;
    var email;
    var phoneNumber;
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController= TextEditingController();
    TextEditingController phoneNumberController= TextEditingController();
    bool isChanging  = false;
    @override
    void initState(){
        super.initState();
        _getUserDetails();
    }
  @override
  Widget build(BuildContext context) {
      usernameController.text = username;
      phoneNumberController.text = phoneNumber;
      emailController.text = email;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: kWhiteColor,
          centerTitle: true,
          title: Text('Ksisel Bilgileri', style: kMediumTextPrimary),
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            TextFieldGrey(
                    controller:usernameController,
                    isEnabled:isChanging ? false:true,
                    hintText: username ?? "",
            ),
            SizedBox(height: 2.0.h),
            TextFieldGrey(
                    controller:emailController,
                    isEnabled:isChanging ? false:true,
              hintText: email ?? "",
            ),
            SizedBox(height: 2.0.h),
            TextFieldGrey(
                    controller:phoneNumberController,
                    isEnabled:isChanging ? false:true,
              hintText: phoneNumber ?? "",
            ),
            SizedBox(height: 2.0.h),
            TextFieldGrey(
              hintText: 'Telefon Numarasi',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
              child: CustomFlatButton(
                width: double.infinity,
                height: 7.0.h,
                title: isChanging ? 'Please Wait' :'Kaydet',
                onTap: () {
                    updatePersonalInfo();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _getUserDetails() async{
      var response = await ApiCalls().getUserDetails();
      var user = response.toJson();
      setState((){
          username = user['username'];
          email = user['email'];
          phoneNumber = user['phoneNumber'];
      });
  }
  void updatePersonalInfo() async{
        setState((){
            isChanging = true;
        });
        var response = await ApiCalls().changePersonalInfo(usernameController.text,emailController.text,phoneNumberController.text);
        setState((){
            isChanging = false;
        });
        if(response == 200){
            FlushbarHelper.createInformation(
                    message:"Personal Information Updated",
                    title:"Success",
            )..show(context);
            Future.delayed(Duration(seconds:3),()=>Navigator.pop(context,));
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

class TextFieldGrey extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isEnabled;
  final Function(String) onChanged;
  final FocusNode focus;

  const TextFieldGrey({Key key, this.hintText,this.controller,this.isEnabled,this.onChanged,this.focus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
            controller:this.controller,
            enabled:this.isEnabled,
            style: TextStyle(color: kPrimaryTextColor),
            cursorColor: kPrimaryTextColor,
            onChanged:onChanged,
            focusNode:focus,
            decoration: InputDecoration(
                    hintText: hintText, // email
                    hintStyle: TextStyle(color: kPrimaryTextColor, fontSize: 14),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryTextColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryTextColor),
                    ),
            ),
    );
  }
}
