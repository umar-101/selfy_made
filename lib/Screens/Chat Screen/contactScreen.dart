import 'package:Selfy_made/Screens/Chat%20Screen/chatScreen.dart';
import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../const.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Sohbet',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(children: [
          MessageTile(),
          MessageTile(),
          MessageTile(),
          MessageTile(),
        ]),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 12.0.h,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 8.0.w,
                    child:
                        Image(image: AssetImage('assets/images/Profile.png')),
                  ),
                  SizedBox(width: 5.0.w),
                  Container(
                    width: 70.0.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Jay Cluter',
                              style: kMediumTextPrimaryLight,
                            ),
                            Spacer(),
                            Text(
                              '9:05 am',
                              style: TextStyle(color: kPrimaryTextColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5.w),
                        Container(
                          width: 70.0.w,
                          height: 5.0.w,
                          child: Text(
                            'The Message text goes here for User if it overflow it fades ',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: kNavBarIconsColor, fontSize: 11.0.sp),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
        Divider(thickness: .3, color: kPrimaryTextColor),
      ],
    );
  }
}
