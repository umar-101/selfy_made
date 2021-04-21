import 'dart:convert';

import 'package:Selfy_made/Screens/Home%20Screen/data.dart';
import 'package:Selfy_made/Screens/Home%20Screen/top_row_category.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/product_page.dart';
import 'package:Selfy_made/Screens/Profile/profile.dart';
import 'package:Selfy_made/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/product_api_service.dart';

import 'appBarWithDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final GlobalKey _scaffoldKey = new GlobalKey();
    String authToken;
    FlutterLocalNotificationsPlugin flutterNotification;
    @override
    void initState(){
        super.initState();
        getAuthToken();
        //var androidInitialize = new AndroidInitializationSettings('app_icon');
        //var iOSinitialize = new IOSInitializationSettings();
        //var initializesSettings = new InitializationSettings(androidInitialize,iOSinitialize);
        //flutterNotification = FlutterLocalNotificationsPlugin();
        //flutterNotification.initialize(initializesSettings,onSelectNotification:notificationSelected);
    }
    Future<void> notificationSelected(String payload) async{

    }
    Future<void> showNotification() async{
        //var androidDetails = new AndroidNotificationDetails("Channel ID","You Got a Message","This is the message");
        //var iosDetails = new IOSNotificationDetails();
        //var generalDetails = new NotificationDetails(androidDetails,iosDetails);
        //await flutterNotification.show(0,"Message","Your Message is ",generalDetails);
    }
    Future<void> getAuthToken() async{
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        authToken = jsonDecode(sharedPreferences.getString('user'))['authToken'];
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MainAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                          );
                        },
                        child: Text('En Yeniler',
                            style: TextStyle(
                                fontSize: 15,
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w500))),
                    SizedBox(height: 4),
                    Container(width: 100, height: 4, color: kPrimaryColor)
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('Takip Ettiklerin',
                        style: TextStyle(
                            fontSize: 15,
                            color: kPrimaryTextColor,
                            fontWeight: FontWeight.w500)),
                    Container(width: 100, height: 4, color: kWhiteColor)
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryRow(
                  title: 'Çanta',
                  iconUrl: 'assets/icons/lock.png',
                ),
                CategoryRow(
                  title: 'Sanat',
                  iconUrl: 'assets/icons/jewelery.png',
                ),
                CategoryRow(
                  title: 'Giyim',
                  iconUrl: 'assets/icons/clothes.png',
                ),
                CategoryRow(
                  title: 'Ayakkabı',
                  iconUrl: 'assets/icons/shoes.png',
                )
              ],
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height-288,
                child:  _buildBody(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context){
    return FutureBuilder<Response>(
                      future: Provider.of<ProductsApiService>(context).getAllProducts('Bearer $authToken'),
                      builder:(context,snapshot){
                          if(snapshot.connectionState != ConnectionState.done){
                              return Center(child:CircularProgressIndicator());
                          }
                          if(!snapshot.hasData){
                              return Center(child:Text('No Products Found'));
                          }
                              var apiProducts = json.decode(snapshot.data.bodyString);
                              return GridView.builder(
                                      itemCount: apiProducts ?? apiProducts.length,
                                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              mainAxisSpacing: 8,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: .83,
                                      ),
                                      itemBuilder: (context, index) {
                                          return InkWell(
                                                  onTap:(){
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                      builder: (context) => ProductPage(id:apiProducts[index]['id'],title:apiProducts[index]['title'],imageUrl:'http://10.0.2.2/images/${apiProducts[index]['images'][0]['image_url']}',explanation:apiProducts[index]['explanation'],category:apiProducts[index]['category'],cost:apiProducts[index]['cost'])),
                                                      );

                                                  },
                                                  child: Container(
                                                                 height: 220,
                                                                 decoration: BoxDecoration(
                                                                         borderRadius: BorderRadius.circular(16),
                                                                         color: Colors.white,
                                                                 ),
                                                                 child: Column(
                                                                         children: [
                                                                             ClipRRect(
                                                                                     borderRadius: BorderRadius.circular(12),
                                                                                     child: CachedNetworkImage(
                                                                                             fit: BoxFit.fill,
                                                                                             width: 200,
                                                                                             height: 140,
                                                                                             imageUrl: 'http://10.0.2.2/images/${apiProducts[index]['images'][0]['image_url']}',
                                                                                     ),
                                                                             ),
                                                                             Padding(
                                                                                     padding: const EdgeInsets.only(
                                                                                             top: 7, left: 10, right: 10),
                                                                                     child: Row(
                                                                                             children: [
                                                                                                 Expanded(
                                                                                                         flex: 4,
                                                                                                         child: Text(
                                                                                                                 apiProducts[index]['title'],
                                                                                                                 overflow: TextOverflow.ellipsis,
                                                                                                                 maxLines: 2,
                                                                                                                 softWrap: false,
                                                                                                                 style:
                                                                                                                 TextStyle(color: kPrimaryTextColor),
                                                                                                         ),
                                                                                                 ),
                                                                                             ],
                                                                                     ),
                                                                             ),
                                                                             Expanded(
                                                                                     child: Padding(
                                                                                             padding: const EdgeInsets.symmetric(
                                                                                                     horizontal: 10, vertical: 5),
                                                                                             child: Row(
                                                                                                     children: [
                                                                                                         Icon(Icons.star_border, size: 26),
                                                                                                         Spacer(),
                                                                                                         Icon(Icons.favorite_border, size: 25),
                                                                                                     ],
                                                                                             ),
                                                                                     ),
                                                                             ),
                                                                             ],
                                                                             ),
                                                                             ),
                                                                             );
                                      },
                                      );
                      },
              );
  }
}
