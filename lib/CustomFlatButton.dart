import 'package:flutter/material.dart';

import 'const.dart';

class CustomFlatButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onTap;

  const CustomFlatButton(
      {Key key, this.width, this.height, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            title,
            style: kMediumTextPrimary.copyWith(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
