import 'package:flutter/material.dart';

import '../../../CustomFlatButton.dart';
import '../../../const.dart';
import 'package:sizer/sizer.dart';

class FlatButtons extends StatelessWidget {
  const FlatButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: Column(
        children: [
          CustomFlatButton(
            width: double.infinity,
            height: 7.0.h,
            title: 'Hemen Al',
            onTap: () {},
          ),
          SizedBox(height: 2.0.h),
          FlatButtonLightColor(),
        ],
      ),
    );
  }
}

class AlertDialogs extends StatelessWidget {
  const AlertDialogs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        AlertDialogContainer(
          title: 'Siyah',
        ),
        AlertDialogContainer(
          title: 'Beden',
        ),
        AlertDialogContainer(
          title: 'Adet',
        ),
      ]),
    );
  }
}

class FlatButtonLightColor extends StatelessWidget {
  const FlatButtonLightColor({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 7.0.h,
        decoration: BoxDecoration(
            color: kPrimaryLightColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            'Sepete Ekle',
            style: kMediumTextPrimary.copyWith(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}

class AlertDialogContainer extends StatelessWidget {
  final String title;
  const AlertDialogContainer({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
        child: Container(
            height: 5.5.h,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.0.sp,
                  ),
                ),
                SizedBox(width: 2.0.w),
                Icon(Icons.arrow_drop_down, size: 18.0.sp)
              ],
            )),
      ),
    );
  }
}
