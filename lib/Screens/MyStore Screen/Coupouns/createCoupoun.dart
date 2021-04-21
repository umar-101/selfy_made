import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import 'coupouns.dart';

class CreateCoupoun extends StatefulWidget {
  @override
  _CreateCoupounState createState() => _CreateCoupounState();
}

class _CreateCoupounState extends State<CreateCoupoun> {
  final compaignName = TextEditingController();
  final discountAmount = TextEditingController();
  final discountCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Kupon Oluştur', style: kMediumTextPrimary), //My Store
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Coupouns()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: compaignName,
              style: TextStyle(color: kPrimaryTextColor),
              cursorColor: kPrimaryTextColor,
              decoration:
                  buildInputDecoration().copyWith(hintText: 'Kampanya Adi'),
            ),
            TextField(
              controller: discountAmount,
              style: TextStyle(color: kPrimaryTextColor),
              cursorColor: kPrimaryTextColor,
              decoration: buildInputDecoration()
                  .copyWith(hintText: 'İndirim Miktari(TRY)'),
            ),
            TextField(
              controller: discountCode,
              style: TextStyle(color: kPrimaryTextColor),
              cursorColor: kPrimaryTextColor,
              decoration:
                  buildInputDecoration().copyWith(hintText: 'İndirim kodu'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: CustomFlatButton(
                width: double.infinity,
                height: 50,
                title: 'Kupon Oluştur',
                onTap: () async {
                  var response = await ApiCalls().addCoupon(compaignName.text,
                      discountAmount.text, discountCode.text);
                  if (response.toString().contains('success')) {
                    Flushbar(
                      title: 'Added',
                      titleText: Text('Coupon Created Successfully'),
                    ).show(context);
                  } else {}
                  Flushbar(
                    title: 'Failed',
                    titleText: Text(response.toString()),
                  ).show(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration buildInputDecoration() {
  return InputDecoration(
    hintText: 'Urun Basligi', // email
    hintStyle: TextStyle(color: kPrimaryTextColor, fontSize: 14),
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryTextColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryTextColor),
    ),
  );
}
