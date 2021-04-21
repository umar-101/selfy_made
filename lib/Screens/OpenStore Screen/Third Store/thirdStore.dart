import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';
import 'productImageContainer.dart';
import 'storeTermsConditions.dart';

class ThirdStore extends StatefulWidget {
  @override
  _ThirdStoreState createState() => _ThirdStoreState();
}

class _ThirdStoreState extends State<ThirdStore> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Mağaza Aç', style: kMediumTextPrimary), //My Store
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductAddImageContainer(),
              TextField(
                style: TextStyle(color: kPrimaryTextColor),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Mağaza adı'), //Store name
              ),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'IBAN Sahibinin Adı Soyadı'),
              ),
              TextField(
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'IBAN No'), //Bank account no
              ),
              TextField(
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Telefon Numarasi'), //Mobile Number
              ),
              TextField(
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration().copyWith(
                    hintText: 'TC Kimlik No'), //Add Feature name example:color
              ),
              TextField(
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration().copyWith(
                    hintText: 'Özellikler ekleyin (örnek: sarı yeşil)'),
              ),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Adresinizi Girin'),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: .7,
                    child: Checkbox(
                      // checkColor: kPrimaryColor,
                      activeColor: kPrimaryColor,
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StoreTerms()),
                        );
                      },
                      child: Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Kullanıcı Sözleşmesi',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'ni ve',
                                  style: TextStyle(color: kPrimaryTextColor)),
                              TextSpan(text: ' Kurrallari'),
                              TextSpan(
                                  text: 'ni okudum, kabul ediyorum',
                                  style: TextStyle(color: kPrimaryTextColor)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.0.h),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 12.0.h,
                decoration: BoxDecoration(
                  color: kErrorColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 4.0.w,
                        backgroundColor: kWhiteColor,
                        child: Center(
                          child: Text(
                            '!',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kErrorColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.0.w),
                      Expanded(
                        child: Text(
                          'Ad, Soyad ve IBAN No aynı kişiye ait olmalıdır. Aksi taktirde para transferi gerçekleştirilemez.',
                          style:
                              TextStyle(color: kWhiteColor, fontSize: 12.0.sp),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.0.h),
              CustomFlatButton(
                width: double.infinity,
                height: 50,
                title: 'Tamamla',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: 'Urun Basligi', // email
      hintStyle: TextStyle(color: kPrimaryTextColor, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryTextColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryTextColor),
      ),
    );
  }
}
