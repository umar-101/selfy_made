import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../const.dart';
import 'individualStore.dart';

class StoreTerms extends StatefulWidget {
  @override
  _StoreTermsState createState() => _StoreTermsState();
}

const String policy =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A commodi, earum eligendi enim esse fugit labore perspiciatis veritatis. Ab, alias aliquid consequuntur debitis dolor excepturi harum iure odit quibusdam voluptatem.';

class _StoreTermsState extends State<StoreTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Column(
        children: [
          Row(
            children: [
              Text('Kullanıcı Sözleşmesi', style: kMediumTextPrimary),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddIndStore()),
                  );
                },
                icon: Icon(
                  Icons.cancel,
                  color: kPrimaryColor,
                  size: 19.0.sp,
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                '$policy',
                style: TextStyle(color: kPrimaryTextColor, height: 1.3),
              ),
              Text(
                '$policy',
                style: TextStyle(color: kPrimaryTextColor, height: 1.3),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
