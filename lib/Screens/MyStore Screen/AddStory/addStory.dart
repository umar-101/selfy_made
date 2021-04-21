import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Ürünlerim', style: kMediumTextPrimary), //My Store
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
