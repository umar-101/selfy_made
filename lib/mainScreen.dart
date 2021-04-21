import 'package:Selfy_made/Screens/Auction%20Screen/auction_screen.dart';
import 'package:Selfy_made/Screens/Cart_Screen/cartScreen.dart';
import 'package:Selfy_made/Screens/FreeProduct%20Screen/free_product.dart';
import 'package:flutter/material.dart';

import 'Screens/Favorite_Screen/favoriteScreen.dart';
import 'Screens/Home Screen/home.dart';
import 'Screens/Search_Screen/searchScreen.dart';
import 'Screens/Trending_Screen/trending.dart';
import 'const.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
    const MainScreen({
        Key key,
    }) : super(key: key);

    @override
    _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    int currentTabIndex = 2;
    Widget currentScreen;

    List<Widget> screens = [];
    TrendingScreen favoriteOrderScreen;
    FavoriteScreen favoriteScreen;
    HomeScreen homeScreen;
    FreeProduct freeProduct;
    AuctionScreen auctionScreen;
    CartScreen cartScreen;
    SearchScreen searchScreen;

    @override
    void initState() {
        super.initState();
        homeScreen = HomeScreen();
        favoriteOrderScreen = TrendingScreen();
        favoriteScreen = FavoriteScreen();

        freeProduct = FreeProduct();
        auctionScreen = AuctionScreen();
        cartScreen = CartScreen();
        searchScreen = SearchScreen();
        screens = [
            favoriteOrderScreen,
            favoriteScreen,
            homeScreen,
            searchScreen,
            cartScreen
        ];

        currentScreen = homeScreen;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                body: currentScreen,
                bottomNavigationBar: ClipRRect(
                        borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        child: BottomNavigationBar(
                                type: BottomNavigationBarType.fixed,
                                currentIndex: currentTabIndex,
                                showSelectedLabels: false,
                                showUnselectedLabels: false,
                                backgroundColor: kWhiteColor,
                                elevation: 10,
                                selectedItemColor: kPrimaryColor,
                                unselectedItemColor: Color(0xFF4A4A4A),
                                iconSize: 20.0.sp,
                                onTap: (int index) {
                                    setState(() {
                                        currentTabIndex = index;
                                        currentScreen = screens[index];
                                    });
                                    // Respond to item press.
                                },
                                items: [
                                    BottomNavigationBarItem(
                                            icon: Icon(Icons.favorite),
                                            // ignore: deprecated_member_use
                                            title: Text(''),
                                    ),
                                    BottomNavigationBarItem(
                                            icon: Icon(Icons.star),
                                            // ignore: deprecated_member_use
                                            title: Text(''),
                                    ),
                                    BottomNavigationBarItem(
                                            icon: Icon(Icons.home),
                                            // ignore: deprecated_member_use
                                            title: Text(''),
                                    ),
                                    BottomNavigationBarItem(
                                            icon: Icon(Icons.search),
                                            // ignore: deprecated_member_use
                                            title: Text(''),
                                    ),
                                    BottomNavigationBarItem(
                                            icon: Icon(Icons.shopping_cart),
                                            // ignore: deprecated_member_use
                                            title: Text(''),
                                    ),
                                    ],
                                    ),
                                    ),
                                    );
    }
}
