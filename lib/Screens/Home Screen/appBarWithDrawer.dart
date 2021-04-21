import 'package:Selfy_made/Screens/Auction%20Screen/auction_screen.dart';
import 'package:Selfy_made/Screens/Cart_Screen/cartScreen.dart';
import 'package:Selfy_made/Screens/Chat%20Screen/contactScreen.dart';
import 'package:Selfy_made/Screens/Help%20Screen/helpScreen.dart';
import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:Selfy_made/Screens/OpenStore%20Screen/openStore.dart';
import 'package:Selfy_made/Screens/Order_Screen/orderScreen.dart';
import 'package:Selfy_made/Screens/Profile/profile.dart';
import 'package:Selfy_made/Screens/Search_Screen/searchScreen.dart';
import 'package:Selfy_made/Screens/Setting_Screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      leading: FlatButton(
          onPressed: () {
            // _scaffoldKey.currentState.openDrawer();
            Scaffold.of(context).openDrawer();
          },
          child: Image(image: AssetImage('assets/icons/hamBurger.png'))),
      actions: [],
      title: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Row(
          children: [
            Image(
                image: AssetImage(
                  'assets/images/app logo.png',
                ),
                color: kPrimaryColor,
                width: 35,
                height: 35),
            SizedBox(width: 5),
            RichText(
              text: TextSpan(
                text: 'Selfy',
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: 'made',
                    style: TextStyle(
                        fontSize: 20,
                        color: kPrimaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuctionScreen()),
                );
              },
              child: Image(
                  image: AssetImage(
                    'assets/icons/store.png',
                  ),
                  color: kPrimaryColor,
                  width: 20,
                  height: 20),
            ),
            SizedBox(width: 3.0.w),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: Image(
                  image: AssetImage(
                    'assets/icons/help.png',
                  ),
                  color: kPrimaryColor,
                  width: 20,
                  height: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: EdgeInsets.fromLTRB(20, 70, 10, 20),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        // gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [kPrimaryLightColor, kPrimaryColor])
      ),
      child: ListView(
        children: [
          DrawerItem(
            imageUrl: 'assets/icons/profile.png',
            title: 'Profil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/chat.png',
            title: 'Sohbet',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/store.png',
            title: 'Siparişlerim',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/help.png',
            title: 'Yardım',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/store.png',
            title: 'Mağaza Aç',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OpenStoreScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/store.png',
            title: 'Mağazam',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyStoreScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/settings.png',
            title: 'Ayarlar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          ),
          DrawerItem(
            imageUrl: 'assets/icons/chat.png',
            title: 'Çıkış',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
    ));
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function onPressed;
  const DrawerItem({
    Key key,
    this.title,
    this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: AssetImage(imageUrl),
        width: 30,
        height: 30,
      ),
      title: Text(title,
          style: TextStyle(color: kPrimaryLightColor, fontSize: 12.0.sp)),
      onTap: onPressed,
    );
  }
}
