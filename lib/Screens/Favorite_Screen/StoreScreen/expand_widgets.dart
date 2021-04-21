import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import 'package:sizer/sizer.dart';

class StoreExpandPanel extends StatelessWidget {
  final String title;
  final String body;

  const StoreExpandPanel({Key key, this.title, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12.0.sp,
              fontWeight: FontWeight.w400,
              color: kPrimaryTextColor),
        ),
      ),

      expanded: Text(
        body,
        style: TextStyle(fontSize: 18, color: kPrimaryTextColor, height: 1.3),
        softWrap: true,
      ),
      // ignore: deprecated_member_use
      tapHeaderToExpand: true,
      // ignore: deprecated_member_use
      hasIcon: true,
    );
  }
}
