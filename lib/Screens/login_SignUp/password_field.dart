import 'package:flutter/material.dart';

import '../../const.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final bool isEnabled;

  const PasswordFieldWidget({Key key, this.hintText,this.textController,this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return TextFormField(
              enabled:isEnabled,
              controller:textController,
              validator:(value){
                  String error;
                  if(value.isEmpty == true){
                      error = hintText+" is Required";
                  }
                  return error;
              },
              style: TextStyle(color: kWhiteColor),
              obscureText: true,
              cursorColor: kWhiteColor,
              decoration: InputDecoration(
                      hintText: hintText, // password
                      hintStyle: TextStyle(color: kWhiteColor, fontSize: 14),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhiteColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhiteColor),
                      ),
              ),
              );
  }
}
