import 'dart:convert';
import 'dart:io';

import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:Selfy_made/Screens/Profile/change_password.dart';
import 'package:Selfy_made/Screens/Profile/choosing_adress.dart';
import 'package:Selfy_made/Screens/Profile/personal_info.dart';
import 'package:Selfy_made/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_calls.dart';
import 'Credit_Card.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
    @override
    _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    final ImagePicker picker = ImagePicker();
    File image;
    String imageUrl;
    String profileImage;

    @override
    void initState(){
        super.initState();
        getUserId();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                backgroundColor: kWhiteColor,
                appBar: AppBar(
                        backgroundColor: kWhiteColor,
                        centerTitle: true,
                        title: Text('Profil', style: kMediumTextPrimary),
                        leading: IconButton(
                                onPressed: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                },
                                icon:
                                Icon(Icons.arrow_back_ios, color: kPrimaryColor, size: 18.0.sp),
                        )),
                body: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                        child: Column(
                                children: [
                                    ProfileImageAdd(
                                            onTap:_getImage,
                                            imageUrl:imageUrl ?? 'http://10.0.2.2/images/profiles/$profileImage',
                                    ),
                                    SizedBox(height: 7.0.h),
                                    ProfileDetailsRow(
                                            title: 'Ksisel Bilgileri',
                                            onTap: () {
                                                Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => PersonalInfo()),
                                                );
                                            }),
                                    Divider(thickness: .3, color: kPrimaryTextColor),
                                    SizedBox(height: 2.0.h),
                                    ProfileDetailsRow(
                                            title: 'Adreslerim',
                                            onTap: () {
                                                Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => AddressScreen()),
                                                );
                                            }),
                                    Divider(thickness: .3, color: kPrimaryTextColor),
                                    SizedBox(height: 2.0.h),
                                    ProfileDetailsRow(
                                            title: 'Şifremi değiştir',
                                            onTap: () {
                                                Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => ChangePassword()),
                                                );
                                            },
                                    ),
                                    Divider(thickness: .3, color: kPrimaryTextColor),
                                    SizedBox(height: 2.0.h),
                                    ProfileDetailsRow(
                                            title: 'Ödeme Yöntemlerim',
                                            onTap: () {
                                                Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => CreditCardScreen()),
                                                );
                                            },
                                    ),
                                    Divider(thickness: .3, color: kPrimaryTextColor),
                                    SizedBox(height: 2.0.h),
                                    ],
                                    ),
                                    ),
                                    );
    }
    Future _getImage() async {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);

        setState(() {
            if (pickedFile != null) {
                image = File(pickedFile.path);
                updateProfile();
            } else {
                print('No image selected.');
            }
        });
    }

    Future<void> getUserId() async{
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        profileImage = jsonDecode(sharedPreferences.getString('user'))['profile_image'];
    }

    void updateProfile() async {


        var data = FormData.fromMap({
            'profile_image': image != null ? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last) : null
        });

        var response = await ApiCalls().updateProfile(data);

        if (response["status"] == 200) {
            setState((){
                imageUrl = 'http://10.0.2.2/images/$profileImage';
            });
            FlushbarHelper.createInformation(
                    message: response['message'],
                    title: "Success",
            )..show(context);
            //Future.delayed(
                    //Duration(seconds: 3),
                    //() => Navigator.pop(
                            //context,
                    //));
        } else {
            Flushbar(
                    title: "Error",
                    message: response['message'] ?? "Something Went Wrong",
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 5),
            )..show(context);
        }
    }
}

class ProfileDetailsRow extends StatelessWidget {
    final String title;
    final Function onTap;

    const ProfileDetailsRow({Key key, this.title, this.onTap}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return InkWell(
                onTap: onTap,
                child: Container(
                        width: double.infinity,
                        height: 5.0.h,
                        child: Row(
                                children: [
                                    Text(title,
                                            style: kMediumTextPrimary.copyWith(
                                                    color: kPrimaryTextColor,
                                            )),
                                    Spacer(),
                                    (Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryTextColor)),
                                ],
                        ),
                ),
        );
    }
}

class ProfileImageAdd extends StatelessWidget {
    final int userId;
    final Function onTap;
    final String imageUrl;
    const ProfileImageAdd({
        this.onTap,
        this.userId,
        this.imageUrl,
        Key key,

    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Align(
                alignment: Alignment.center,
                child: Container(
                        width: 100,
                        child: Stack(
                                children: [
                                    CircleAvatar(
                                            radius: 40,
                                            child: Image.network(
                                                    imageUrl,
                                            ),
                                    ),
                                    Positioned(
                                            left: 55,
                                            bottom: 0,
                                            child: GestureDetector(
                                                    onTap:onTap,
                                                    child: CircleAvatar(
                                                            radius: 15,
                                                            backgroundColor: kPrimaryLightColor,
                                                            child: Icon(
                                                                    Icons.add,
                                                                    size: 30,
                                                                    color: Colors.white,
                                                            )),
                                            ),
                                    )
                                            ],
                                            ),
                                            ),
                                            );
    }
}
