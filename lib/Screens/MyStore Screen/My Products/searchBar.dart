import 'package:flutter/material.dart';

import '../../../const.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: TextField(
        style: TextStyle(color: kBlackColor),
        cursorHeight: 20,
        cursorWidth: 1,
        textAlign: TextAlign.center,
        obscureText: true,
        cursorColor: kPrimaryTextColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: kNavBarIconsColor,
            size: 30,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Color(0xFFF0F1F5), width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Color(0xFFF0F1F5),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Color(0xFFF0F1F5),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
