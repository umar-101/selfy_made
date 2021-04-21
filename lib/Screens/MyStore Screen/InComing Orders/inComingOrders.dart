import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class InComingOrders extends StatefulWidget {
  @override
  _InComingOrdersState createState() => _InComingOrdersState();
}

class _InComingOrdersState extends State<InComingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Gelen Siparişler',
              style: kMediumTextPrimary), //Incoming Orders
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
                    Image(image: AssetImage('assets/images/Cart.png')),
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
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    'Toplam Satış',
                    style: kMediumTextPrimary.copyWith(fontSize: 18),
                  ),
                  SizedBox(height: 5),
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
          )
        ],
      ),
    );
  }
}
