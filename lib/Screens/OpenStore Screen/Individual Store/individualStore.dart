import 'dart:io';

import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';
import '../openStore.dart';
import 'storeTermsConditions.dart';

class AddIndStore extends StatefulWidget {
  @override
  _AddIndStoreState createState() => _AddIndStoreState();
}

class _AddIndStoreState extends State<AddIndStore> {
  bool checkedValue = false;
  //Image Picker Code
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  //

  final storeNameController = TextEditingController();
  final ibanController = TextEditingController();
  final ibanOwnerController = TextEditingController();
  final phoneController = TextEditingController();
  final cnicController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
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
                MaterialPageRoute(builder: (context) => OpenStoreScreen()),
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
              InkWell(
                onTap: () => _onImageButtonPressed(),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 25.0.w,
                        height: 14.0.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Image(
                          fit: BoxFit.fill,
                          image: _imageFile != null
                              ? AssetImage(_imageFile.path)
                              : AssetImage('assets/images/Cart.png'),
                        )),
                      ),
                      Positioned(
                        top: 10.0.h,
                        left: 18.0.w,
                        child: CircleAvatar(
                            radius: 3.5.w,
                            backgroundColor: kPrimaryLightColor,
                            child: Icon(
                              Icons.add,
                              size: 20.0.sp,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              TextField(
                style: TextStyle(color: kPrimaryTextColor),
                controller: storeNameController,
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Mağaza adı'), //Store name
              ),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: ibanOwnerController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'IBAN Sahibinin Adı Soyadı'),
              ),
              TextField(
                controller: ibanController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'IBAN No'), //Bank account no
              ),
              TextField(
                controller: phoneController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Telefon Numarasi'), //Mobile Number
              ),
              TextField(
                controller: cnicController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration().copyWith(
                    hintText: 'TC Kimlik No'), //Add Feature name example:color
              ),
              TextField(
                controller: cityController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration().copyWith(
                    hintText: 'Özellikler ekleyin (örnek: sarı yeşil)'),
              ),
              TextField(
                controller: addressController,
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
                  onTap: () async {
                    print('he');
                    var response;
                    try {
                      response = await ApiCalls().saveStore(
                          storeNameController.text,
                          ibanOwnerController.text,
                          ibanController.text,
                          phoneController.text,
                          cnicController.text,
                          cityController.text,
                          addressController.text,
                          _imageFile as File);

                      if (response == 'success') {
                        Flushbar(
                          title: "Success",
                          message: 'Store has been added',
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 5),
                        )..show(context);
                      } else {
                        Flushbar(
                          title: "Error",
                          message: response ?? "Something Went Wrong",
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 5),
                        )..show(context);
                      }
                    } on Exception catch (ex) {
                      print(ex.toString());
                      response = ex.toString();
                    }
                  })
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

  void _onImageButtonPressed() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
