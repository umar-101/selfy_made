import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/Comments/comments.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'about_StorePage.dart';
import 'follow_ask_store.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Widget currentScreen;

  List<Widget> screens = [];
  Comments commentScreen; // Yorumula
  FollowAskStorePage followAsk;
  AboutStore about;

  @override
  void initState() {
    super.initState();
    followAsk = FollowAskStorePage();
    commentScreen = Comments();
    about = AboutStore();

    screens = [
      followAsk,
      commentScreen,
      about,
    ];

    currentScreen = followAsk;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Mağaza', style: kMediumTextPrimary), //My Orders
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: CategoryBuilder(),
    );
  }
}

class CategoryBuilder extends StatefulWidget {
  final Widget currentScreen;
  final List screens;
  const CategoryBuilder({
    Key key,
    this.currentScreen,
    this.screens,
  }) : super(key: key);

  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  final List<String> items = [
    'Mağaza',
    'Yorumlar',
    'Hakkında',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 7.0.h,
          decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
            BoxShadow(
                color: Colors.grey[200],
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0.1, 1))
          ]),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;

                      // currentScreen = screens[index];
                    });
                  },
                  child: Container(
                      child: Column(
                    children: [
                      Text(
                        items[index],
                        style: selectedIndex == index
                            ? kSmallTextPrimary.copyWith(
                                fontWeight: FontWeight.w400)
                            : kSmallTextPrimary.copyWith(
                                color: kNavBarIconsColor,
                                fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Container(
                        width: 20.0.w,
                        height: 0.5.h,
                        color: selectedIndex == index
                            ? kPrimaryColor
                            : Colors.white,
                      )
                    ],
                  )),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
