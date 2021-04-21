import 'package:Selfy_made/Screens/Profile/personal_info.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

import '../../CustomFlatButton.dart';
import 'profile.dart';
import 'package:sizer/sizer.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F5),
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text('Adres Seçimi',
              style: kMediumTextPrimary.copyWith(color: kWhiteColor)),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kWhiteColor,
              size: 18.0.sp,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            AddressCardContainer(),
            Divider(thickness: .3, color: kPrimaryTextColor),
            AddressCardContainer(),
          ],
        ),
      ),
    );
  }
}

class AddressCardContainer extends StatelessWidget {
  const AddressCardContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        width: double.infinity,
        height: 26.0.h,
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Ev', style: kMediumTextPrimary),
                  Spacer(),
                  Container(width: 3.0.w, height: 3.0.w, color: kPrimaryColor)
                ],
              ),
              Text(
                'Lorem ipsem',
                style: kMediumTextPrimary.copyWith(color: kNavBarIconsColor),
              ),
              Text('14405 179th Ave SE #129, Street , Monroe, WA, 98272 ',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0.sp,
                      color: kNavBarIconsColor)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                            color: Color(0xFF757575), child: BottomSheet()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 6.5.h,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 1)),
                    child: Center(
                        child: Text('Düzenle', style: kSmallTextPrimary)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            TextFieldGrey(
              hintText: 'Ev',
            ),
            TextFieldGrey(
              hintText: '14405 179th Ave SE #129, Monroe, WA, 98272',
            ),
            TextFieldGrey(
              hintText: 'Istanbul',
            ),
            TextFieldGrey(
              hintText: 'Eyup',
            ),
            TextFieldGrey(
              hintText: 'Kavastakan donunence',
            ),
            SizedBox(height: 5.0.h),
            CustomFlatButton(
              width: 60.0.w,
              height: 7.0.h,
              title: 'Kayıt Ol',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
