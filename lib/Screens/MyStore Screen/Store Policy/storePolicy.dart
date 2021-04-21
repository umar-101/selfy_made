import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/Coupouns/createCoupoun.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class StorePolicy extends StatefulWidget {
  @override
  _StorePolicyState createState() => _StorePolicyState();
}

class _StorePolicyState extends State<StorePolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title:
              Text('Mağaza Politikaları', style: kMediumTextPrimary), //My Store
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration:
                    buildInputDecoration().copyWith(hintText: 'Cevap Yaz'),
              ),
              SizedBox(height: 20),
              CustomFlatButton(
                width: double.infinity,
                height: 50,
                onTap: () {},
                title: 'Kaydet',
              )
            ],
          ),
        ),
      ),
    );
  }
}
