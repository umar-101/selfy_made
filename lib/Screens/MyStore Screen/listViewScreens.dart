import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'AddProduct/addProduct.dart';
import 'AddStory/addStory.dart';
import 'Comments/comments.dart';
import 'Coupouns/coupouns.dart';
import 'InComing Orders/inComingOrders.dart';
import 'Instagram Share/instagramShare.dart';
import 'Make Add/makeAdd.dart';
import 'My Products/myProducts.dart';
import 'Request Payments/requestPayments.dart';
import 'Store Policy/storePolicy.dart';

class ListViewScreens extends StatelessWidget {
  const ListViewScreens({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          ProfileDetailsRow(
              title: 'Ürünlerim', // MyProducts
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProducts()),
                );
              }),
          ProfileDetailsRow(
              title: 'Ürün Ekle', // Add Products
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProduct()),
                );
              }),
          ProfileDetailsRow(
            title: 'Story Ekle', // Add Story
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddStory()),
              );
            },
          ),
          ProfileDetailsRow(
            title: 'Reklam Ver', //Make Add
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MakeAdd()),
              );
            },
          ),
          ProfileDetailsRow(
            title: 'Gelen Siparişler', // incoming orders
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InComingOrders()),
              );
            },
          ),
          ProfileDetailsRow(
            title: 'Ödeme İste', //Request payments
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestPayments()),
              );
            },
          ),
          ProfileDetailsRow(
            title:
                'Mağazanı Instagramda Paylaş', // Share your store on instagram
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstagramShare()),
              );
            },
          ),
          ProfileDetailsRow(
            title: 'Kuponlar', //Coupouns
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Coupouns()),
              );
            },
          ),
          ProfileDetailsRow(
            title: 'Mağaza Politikaları', // Store Policy
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StorePolicy()),
              );
            },
          ),
          ProfileDetailsRow(
            title: 'Yorumlarım', // Comments
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Comments()),
              );
            },
          ),
        ],
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
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(children: [
              Text(title,
                  style: kMediumTextPrimary.copyWith(color: kPrimaryTextColor)),
              Spacer(),
              (Icon(Icons.arrow_forward_ios,
                  size: 15.0.sp, color: kPrimaryTextColor)),
            ]),
            Divider(thickness: .3, color: kPrimaryTextColor),
          ],
        ),
      ),
    );
  }
}
