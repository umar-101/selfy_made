import 'package:Selfy_made/Screens/Profile/add_credit_cardScreen.dart';
import 'package:Selfy_made/Screens/Profile/my_cards.dart';
import 'package:Selfy_made/Screens/Profile/profile.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Ödeme Yöntemleri', style: kMediumTextPrimary),
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            ProfileDetailsRow(
                title: 'Kart Bilgisi Ekle', // add Card Screen
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCreditCard()),
                  );
                }),
            Divider(thickness: .3, color: kPrimaryTextColor),
            SizedBox(height: 15),
            ProfileDetailsRow(
                title: 'Kartlarım', //my Cards
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCards()),
                  );
                }),
            Divider(thickness: .3, color: kPrimaryTextColor),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsRow extends StatelessWidget {
  final String title;
  final Function onTap;

  const ProfileDetailsRow({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(children: [
          Text(
            title,
            style: kMediumTextPrimary.copyWith(color: kPrimaryTextColor),
          ),
          Spacer(),
          (Icon(Icons.arrow_forward_ios,
              size: 16.0.sp, color: kPrimaryTextColor)),
        ]),
      ),
    );
  }
}
