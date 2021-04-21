import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

import 'store_Page.dart';

class AboutStore extends StatefulWidget {
  @override
  _AboutStoreState createState() => _AboutStoreState();
}

class _AboutStoreState extends State<AboutStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Mağaza', style: kMediumTextPrimary), //My Orders
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
      body: Column(
        children: [
          CategoryBuilder(),
          Text("Hira"),
        ],
      ),
    );
  }
}
