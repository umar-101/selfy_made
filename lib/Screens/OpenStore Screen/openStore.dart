import 'package:Selfy_made/Screens/OpenStore%20Screen/Third%20Store/thirdStore.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import 'package:sizer/sizer.dart';

import 'Individual Store/individualStore.dart';
import 'Second Store/SecondStore.dart';

class OpenStoreScreen extends StatefulWidget {
  @override
  _OpenStoreScreenState createState() => _OpenStoreScreenState();
}

class _OpenStoreScreenState extends State<OpenStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [kPrimaryColor, Color(0xFFAED8D8)])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: kWhiteColor,
                    radius: 3.5.w,
                    child: Icon(
                      Icons.close,
                      size: 18.0.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.white54,
                            spreadRadius: 30,
                            blurRadius: 40,
                          )
                        ]),
                      ),
                      SizedBox(width: 30),
                      Image(
                          image: AssetImage('assets/images/app logo.png'),
                          width: 120,
                          height: 120),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "SelfyMade'te \nMağaza Açmak Çok Kolay!",
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 23.0.sp,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Sadece birkaç dakika içerisinde mağazanızı aktif hale getirip, satış yapmaya başlayabilirsiniz!',
                  style: TextStyle(color: kNavBarIconsColor, fontSize: 13.0.sp),
                ),
                StoreTypeContainer(
                  title: 'Bireysel (Şirketim Yok)',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddIndStore()),
                    );
                  },
                ),
                StoreTypeContainer(
                  title: 'Şahıs Şirketi',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondStore()),
                    );
                  },
                ),
                StoreTypeContainer(
                  title: 'Limited / Anonim Şirket',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdStore()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StoreTypeContainer extends StatelessWidget {
  final String title;
  final Function onTap;
  const StoreTypeContainer({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            width: double.infinity,
            height: 7.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF516c6d),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(color: kWhiteColor, fontSize: 12.0.sp),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor,
                    size: 14.0.sp,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class StoreImageContainer extends StatelessWidget {
  const StoreImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Positioned(
              bottom: 50,
              left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: 120,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 35),
                    Text('Jane Doe',
                        style: kMediumTextPrimary.copyWith(
                            color: kPrimaryTextColor)),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/location.png'),
                        ),
                        SizedBox(width: 4),
                        Text('Cali, California',
                            style: TextStyle(color: kPrimaryTextColor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 90,
                height: 95,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: kWhiteColor)),
                child: Image(image: AssetImage('assets/images/Cart.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
