import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Sizer extends StatefulWidget {
  @override
  _SizerState createState() => _SizerState();
}

class _SizerState extends State<Sizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 50.0.w,
            height: 90.0.h,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
