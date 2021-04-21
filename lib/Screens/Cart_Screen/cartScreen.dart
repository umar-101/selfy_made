import 'dart:convert';

import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:Selfy_made/data/product_api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../CustomFlatButton.dart';
import '../../const.dart';
import 'cart_address.dart';

class CartScreen extends StatefulWidget {
    @override
    _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
                backgroundColor: kScaffoldColor,
                appBar: AppBar(
                        backgroundColor: kPrimaryColor,
                        title: Text('Sepetim (2)',
                                style: kMediumTextPrimary.copyWith(color: kWhiteColor)),
                        centerTitle: true,
                        leading: IconButton(
                                onPressed: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                },
                                icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: kWhiteColor,
                                      ),
                        )),
                body:FutureBuilder(
                        future:Provider.of<ProductsApiService>(context).getAllCartItems('Bearer 1|cU7PnMnwHJktqLCzqMNjkglRsQqa1Ao98X2NoU4p'),
                        builder:(context,snapshot){
                            if(snapshot.connectionState != ConnectionState.done){
                                return Center(child:CircularProgressIndicator());
                            }
                            if(!snapshot.hasData){
                                return Center(child:Text('No Products Found'));
                            }
                            var cartItems = json.decode(snapshot.data.bodyString);
                                        return Column(
                                                children: [
                                                    Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                            child: Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    height: 120,
                                                                    decoration: BoxDecoration(
                                                                            color: kWhiteColor,
                                                                            borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                                                                            child: Row(
                                                                                    children: [
                                                                                     CachedNetworkImage(
                                                                                             fit: BoxFit.fill,
                                                                                             width: 130,
                                                                                             height: 140,
                                                                                             imageUrl: 'http://10.0.2.2/images/${cartItems[0]['images'][0]['image_url']}',
                                                                                     ),
                                                                                        SizedBox(width: 10),
                                                                                        Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                    Text(
                                                                                                            'Kartvizit 1000’li baskı\n0.3mmx12cmx8cm',
                                                                                                            style:
                                                                                                            TextStyle(color: kPrimaryTextColor, fontSize: 16),
                                                                                                    ),
                                                                                                    SizedBox(height: 5),
                                                                                                    Expanded(
                                                                                                            child: Container(
                                                                                                                    width: MediaQuery.of(context).size.width * 0.55,
                                                                                                                    child: Row(children: [
                                                                                                                        Text(
                                                                                                                                '1 Adet  XL   Yeşil',
                                                                                                                                style: TextStyle(
                                                                                                                                        color: kPrimaryTextColor,
                                                                                                                                        fontSize: 17,
                                                                                                                                        fontWeight: FontWeight.w500),
                                                                                                                        ),
                                                                                                                        Spacer(),
                                                                                                                        Text(
                                                                                                                                'İptal Et',
                                                                                                                                style: TextStyle(
                                                                                                                                        color: kRedColor,
                                                                                                                                        fontSize: 13,
                                                                                                                                ),
                                                                                                                        ),
                                                                                                                    ]),
                                                                                                            ),
                                                                                        ),
                                                                                        SizedBox(height: 3),
                                                                                        Expanded(
                                                                                                child: Container(
                                                                                                        width: MediaQuery.of(context).size.width * 0.55,
                                                                                                        child: Row(children: [
                                                                                                            Text(
                                                                                                                    'Ücretsiz Kargo',
                                                                                                                    style: TextStyle(
                                                                                                                            color: kPrimaryTextColor, fontSize: 12),
                                                                                                            ),
                                                                                                            Spacer(),
                                                                                                            Text(
                                                                                                                    '17.11.2020',
                                                                                                                    style: TextStyle(
                                                                                                                            color: kPrimaryColor, fontSize: 12),
                                                                                                            ),
                                                                                                        ]),
                                                                                                ),
                                                                                        ),
                                                                                        SizedBox(height: 3),
                                                                                        Expanded(
                                                                                                child: Container(
                                                                                                        width: MediaQuery.of(context).size.width * 0.55,
                                                                                                        child: Row(children: [
                                                                                                            Text(
                                                                                                                    '100₺',
                                                                                                                    style: TextStyle(
                                                                                                                            color: kPrimaryTextColor,
                                                                                                                            fontSize: 17,
                                                                                                                            fontWeight: FontWeight.w500),
                                                                                                            ),
                                                                                                            Spacer(),
                                                                                                            Text(
                                                                                                                    'Kargo Bilgisini Gir',
                                                                                                                    style: kSmallTextPrimary.copyWith(
                                                                                                                            decoration: TextDecoration.underline),
                                                                                                            ),
                                                                                                        ]),
                                                                                                ),
                                                                                        ),
                                                                                        ],
                                                                                        )
                                                                                                ],
                                                                                                ),
                                                                                                ),
                                                                                                ),
                                                                                                ),
                                                                                                Spacer(),
                                                                                                Padding(
                                                                                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                                                                                        child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 12.0.h,
                                                                                                                decoration: BoxDecoration(
                                                                                                                        color: kWhiteColor,
                                                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                                                        boxShadow: [
                                                                                                                            BoxShadow(
                                                                                                                                    color: Colors.grey[200],
                                                                                                                                    spreadRadius: 4,
                                                                                                                                    blurRadius: 4,
                                                                                                                                    offset: Offset(0, 1),
                                                                                                                            )
                                                                                                                        ]),
                                                                                                                child: Padding(
                                                                                                                        padding:
                                                                                                                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                                                                                                                                                                fontSize: 11.0.sp,
                                                                                                                                                                fontWeight: FontWeight.w400),
                                                                                                                                                ),
                                                                                                                                                SizedBox(height: 1.0.w),
                                                                                                                                                Text(
                                                                                                                                                        '299.99₺',
                                                                                                                                                        style: TextStyle(
                                                                                                                                                                color: kPrimaryTextColor,
                                                                                                                                                                fontSize: 15.0.sp,
                                                                                                                                                                fontWeight: FontWeight.w500),
                                                                                                                                                ),
                                                                                                                                            ],
                                                                                                                                    ),
                                                                                                                                    Spacer(),
                                                                                                                                    CustomFlatButton(
                                                                                                                                            width: 30.0.w,
                                                                                                                                            height: 6.0.h,
                                                                                                                                            title: 'Satın Al',
                                                                                                                                            onTap: () {
                                                                                                                                                Navigator.push(
                                                                                                                                                        context,
                                                                                                                                                        MaterialPageRoute(builder: (context) => CartAdress()),
                                                                                                                                                );
                                                                                                                                            },
                                                                                                                                    ),
                                                                                                                                    ],
                                                                                                                                    ),
                                                                                                                                    ),
                                                                                                                                    ),
                                                                                                                                    )
                                                                                                                                            ],
                                                                                                                                            );
                                    },
                                    )
                                            );
                        }
    }
