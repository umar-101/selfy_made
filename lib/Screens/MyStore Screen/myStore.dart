import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'listViewScreens.dart';
import 'profileImageBack.dart';

class MyStoreScreen extends StatefulWidget {
  @override
  _MyStoreScreenState createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends State<MyStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Mağazam',
              style: kMediumTextPrimary.copyWith(fontSize: 13.0.sp)), //My Store
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [ProfileAndBackImageContainer(), ListViewScreens()],
        ),
      ),
    );
  }
}
