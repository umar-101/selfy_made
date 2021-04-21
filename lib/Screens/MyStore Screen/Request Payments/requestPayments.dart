import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class RequestPayments extends StatefulWidget {
  @override
  _RequestPaymentsState createState() => _RequestPaymentsState();
}

class _RequestPaymentsState extends State<RequestPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Ödeme İste', style: kMediumTextPrimary), //My Store
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyStoreScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: TextField(
              style: TextStyle(color: kPrimaryTextColor),
              cursorColor: kPrimaryTextColor,
              decoration:
                  buildInputDecoration().copyWith(hintText: 'Istenecek Tutar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              style: TextStyle(color: kPrimaryTextColor),
              cursorColor: kPrimaryTextColor,
              decoration: buildInputDecoration()
                  .copyWith(hintText: 'TR65 00001 0012 7878 7862 8900 01 '),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: CustomFlatButton(
              width: double.infinity,
              height: 50,
              title: 'Ödemeyi İste',
              onTap: () {},
            ),
          ),
          Spacer(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      'Çekilebilir Tutar',
                      style: kMediumTextPrimary.copyWith(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: kPrimaryColor,
                      child: Center(
                          child: Text(
                        '478,55₺',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
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
