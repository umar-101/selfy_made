import 'package:Selfy_made/Screens/login_SignUp/login.dart';
import 'data/product_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import 'Screens/Cart_Screen/cartScreen.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return LayoutBuilder(
                //return LayoutBuilder
                builder: (context, constraints) {
                    return OrientationBuilder(
                            //return OrientationBuilder
                            builder: (context, orientation) {
                                //initialize SizerUtil()
                                SizerUtil().init(constraints, orientation); //initialize SizerUtil
                                return Provider(
                                        create:(_)=>ProductsApiService.create(),
                                        dispose:(_,ProductsApiService service) => service.client.dispose(),
                                        child: MaterialApp(
                                                debugShowCheckedModeBanner: false,
                                                title: 'Sizer',
                                                theme: ThemeData.light(),
                                                home:LoginScreen(),
                                                //home: MainScreen(),
                                        ),
                                );
                            },
                    );
                },
        );
    }
}
