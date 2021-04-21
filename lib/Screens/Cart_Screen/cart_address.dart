import 'package:Selfy_made/Screens/Cart_Screen/cargo_address.dart';
import 'package:Selfy_made/Screens/Cart_Screen/cartScreen.dart';
import 'package:Selfy_made/Screens/Profile/choosing_adress.dart';
import 'package:flutter/material.dart';

import '../../CustomFlatButton.dart';
import '../../const.dart';
import 'package:sizer/sizer.dart';

class CartAdress extends StatefulWidget {
  @override
  _CartAdressState createState() => _CartAdressState();
}

class _CartAdressState extends State<CartAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Adres Seçimi',
            style: kMediumTextPrimary.copyWith(color: kWhiteColor)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kWhiteColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Row(
              children: [
                CartTopContainer(
                  imageUrl: 'assets/images/image4.png',
                  title: 'Adres Seçimi',
                ),
                SizedBox(width: 2.0.w),
                CartTopContainer(
                  imageUrl: 'assets/images/image4.png',
                  title: 'Kargo Seçimi',
                ),
                SizedBox(width: 2.0.w),
                CartTopContainer(
                  imageUrl: 'assets/images/image4.png',
                  title: 'Ödeme',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AddressCardContainer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AddressCardContainer(),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 9.0.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(1, 0),
                    )
                  ],
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Toplam Tutar (2 Ürün)',
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 1.0.w),
                        Text(
                          '299.99₺',
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomFlatButton(
                      width: 25.0.w,
                      height: 5.5.h,
                      title: 'Devam',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CargoAdress()),
                        );
                      },
                    ),
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

class CartTopContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  const CartTopContainer({
    Key key,
    this.title,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 16.0.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryColor,
            image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    kPrimaryColor.withOpacity(0.3), BlendMode.dstATop))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: kSmallTextPrimary.copyWith(color: kWhiteColor)),
              SizedBox(height: 1.0.h),
              Text(
                'Bekliyor',
                style: TextStyle(color: kWhiteColor, fontSize: 9.0.sp),
              ),
              SizedBox(height: 0.7.h),
              Stack(
                children: [
                  Container(
                    width: 23.0.w,
                    height: 4,
                    color: Color(0xFF7A9596),
                  ),
                  Container(
                    width: 1.0.w,
                    height: 3,
                    color: kWhiteColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
