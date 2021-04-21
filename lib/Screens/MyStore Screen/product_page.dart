import 'package:Selfy_made/Screens/Cart_Screen/cartScreen.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
    final int id;
   final String imageUrl;
   final String title;
   final String explanation;
   final String category;
   final int cost;
  ProductPage({key,this.id, this.imageUrl, this.title, this.explanation, this.category,this.cost}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _chosenColor;
  String _chosenSize;
  String _chosenQty;
  int cartItems = 0;

  bool isCommentOpened = false;
  bool isProductExplationOpened = false;
  bool isShippingOpened = false;
  bool isPolicyOpened = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //Background Image
          Container(
            width: size.width,
            height: size.height,
            child: CachedNetworkImage(
                    imageUrl:widget.imageUrl,
                    fit: BoxFit.cover
                    ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child:
                              IconButton(
                                      onPressed:(){
                                          Navigator.pop(context);
                                      },
                                     icon:Icon( Icons.arrow_back_ios, color: Colors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                      icon:Icon(Icons.shopping_cart),
                                      onPressed:()=> Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                                  builder: (context) => CartScreen()),
                                                  ),
                                  color: Colors.white),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                        child: Text('$cartItems')
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.3),
                //Bottom White Container
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        )),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          //Name
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border),
                                    Icon(Icons.star_border)
                                  ],
                                )
                              ],
                            ),
                          ),
                          //Rating
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('5.00', style: TextStyle(fontSize: 16)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.star, color: Colors.orange),
                                Icon(Icons.star, color: Colors.orange),
                                Icon(Icons.star, color: Colors.orange),
                                Icon(Icons.star, color: Colors.orange),
                                Icon(Icons.star, color: Colors.orange),
                              ],
                            ),
                          ),
                          //Price
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('\$${widget.cost}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start),
                          ),
                          //Discount
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('\$100.99',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 15),
                                    textAlign: TextAlign.start),
                                SizedBox(width: 5),
                                Container(
                                  color: Colors.blueGrey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text('-14%'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //DropDowns
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Color
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                      border: Border.all()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenColor,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Blue',
                                          'Green',
                                          'Red',
                                          'Yello',
                                          'Pink',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Color",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenColor = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Size
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                      border: Border.all()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenSize,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Small',
                                          'Medium',
                                          'Large',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Size",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenSize = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Pcs
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                      border: Border.all()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenQty,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          '1',
                                          '2',
                                          '3',
                                          '4',
                                          '5',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Pcs",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenQty = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Button Buy Now
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: size.width * 0.6,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          //Button Add to cart
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: () async{
                                    var response = await ApiCalls().addProductToCart({'id':widget.id});
                                    if(response == "success"){
                                        setState((){
                                            cartItems++;
                                        });
                                        FlushbarHelper.createSuccess(
                                                title:'Success',
                                                message:'Product Added To Cart Successfully',
                                                duration:Duration(seconds:3)
                                        )..show(context);
                                    }else{
                                        FlushbarHelper.createError(
                                                title:'Error',
                                                message:'Something Went Wrong',
                                                duration:Duration(seconds:3)
                                        )..show(context);
                                    }
                                },
                                child: Container(
                                  width: size.width * 0.6,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          //Comments Section
                          GestureDetector(
                            onTap: () {
                              if (isCommentOpened) {
                                setState(() {
                                  isCommentOpened = false;
                                });
                              } else {
                                setState(() {
                                  isCommentOpened = true;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Comments of Store ',
                                            style: TextStyle(fontSize: 18)),
                                        Text('(37 Comments)',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Icon(
                                      isCommentOpened
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 30,
                                    ),
                                  ]),
                            ),
                          ),
                          isCommentOpened
                              ? Column(
                                  children: [
                                    //Comment
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            child: CircleAvatar(
                                                backgroundImage: AssetImage('assets/images/user.jpg')),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Yazan'),
                                                Text('15.07.2019'),
                                              ],
                                            ),
                                            Text('alidesedero',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                              ],
                                            ),
                                            Container(
                                              width: size.width * 0.7,
                                              child: Text(
                                                'Beklediğimden çok daha iyi bir ürün çıktı. Hızlı kargo içinde ayrıca teşekkür ederim.',
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4),
                                      child: Divider(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/user.jpg')),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Yazan'),
                                                Text('15.07.2019'),
                                              ],
                                            ),
                                            Text('alidesedero',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 16),
                                              ],
                                            ),
                                            Container(
                                              width: size.width * 0.7,
                                              child: Text(
                                                'Beklediğimden çok daha iyi bir ürün çıktı. Hızlı kargo içinde ayrıca teşekkür ederim.',
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Divider(),
                          ),
                          //Product Explainment
                          GestureDetector(
                            onTap: () {
                              if (isProductExplationOpened) {
                                setState(() {
                                  isProductExplationOpened = false;
                                });
                              } else {
                                setState(() {
                                  isProductExplationOpened = true;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Product Explainment ',
                                        style: TextStyle(fontSize: 18)),
                                    Icon(
                                      isProductExplationOpened
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 30,
                                    ),
                                  ]),
                            ),
                          ),
                          isProductExplationOpened
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width * 0.95,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Divider(),
                          ),
                          //Shipping
                          GestureDetector(
                            onTap: () {
                              if (isShippingOpened) {
                                setState(() {
                                  isShippingOpened = false;
                                });
                              } else {
                                setState(() {
                                  isShippingOpened = true;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Shipping',
                                        style: TextStyle(fontSize: 18)),
                                    Icon(
                                      isShippingOpened
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 30,
                                    ),
                                  ]),
                            ),
                          ),
                          isShippingOpened
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width * 0.95,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Divider(),
                          ),
                          //Store Policy
                          GestureDetector(
                            onTap: () {
                              if (isPolicyOpened) {
                                setState(() {
                                  isPolicyOpened = false;
                                });
                              } else {
                                setState(() {
                                  isPolicyOpened = true;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Store Policy',
                                        style: TextStyle(fontSize: 18)),
                                    Icon(
                                      isPolicyOpened
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 30,
                                    ),
                                  ]),
                            ),
                          ),
                          isPolicyOpened
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width * 0.95,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam leo eros, fringilla vel efficitur sed, posuere non odio. Nullam eu posuere est, sit amet facilisis sapien. Sed porta velit eu cursus sollicitudin. Duis ut turpis rutrum, viverra mi at, maximus quam. Vivamus ac consequat sem. Cras lobortis lobortis felis eu lacinia. Nam et egestas ex. Morbi gravida pulvinar velit, eu molestie nisl ultricies pharetra. \n\nEtiam interdum ut elit sed aliquet. Vivamus vitae iaculis massa, in facilisis ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquam orci urna, eget faucibus dolor dapibus sit amet. Nullam posuere, dolor id auctor cursus, ante libero feugiat turpis, eu convallis est enim quis eros. Sed tincidunt vel libero at ultricies. Ut urna elit, varius vitae tempor sed, porttitor in velit. Proin sollicitudin aliquet ligula, vel hendrerit magna tempus interdum. Suspendisse bibendum est enim, in tempor enim gravida id. Duis vestibulum mauris in elementum tincidunt. Donec malesuada magna eget faucibus posuere. \n\nCras in ligula metus. Aenean vel quam sed ipsum euismod rhoncus in a turpis. Suspendisse vel mollis arcu. Etiam dignissim dui sed pulvinar euismod. Curabitur dapibus dui non velit lobortis, aliquam tincidunt sem vulputate. Pellentesque volutpat lobortis purus, ut ultricies nibh gravida non. Curabitur nisl arcu, molestie sit amet gravida id, fringilla non leo. Integer tincidunt enim a ante aliquam, id scelerisque massa fermentum. \n\nSed porta sodales molestie. Nulla tristique porttitor tristique. Donec consequat egestas odio lacinia cursus. Aenean ornare sagittis ipsum, a commodo mi hendrerit sit amet. Mauris rutrum ante mauris, vitae pharetra velit bibendum sed. Donec vehicula a mi et lacinia. Suspendisse id hendrerit turpis. In in ante semper, aliquam lectus at, mattis massa. In in nisl pulvinar lacus eleifend convallis. Phasellus enim risus, placerat sed varius ac, mollis non lorem. Nulla facilisi. Sed vel quam ornare, egestas ante et, luctus turpis. \n\nUt sed libero ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi dolor ante, pulvinar sit amet nulla id, auctor semper leo. Sed pharetra felis id tincidunt gravida. Sed dictum risus in nunc suscipit luctus. Nunc non augue dignissim, pellentesque ex sed, condimentum lectus. Fusce efficitur ligula a nisi convallis eleifend. Duis id porta nisl. Quisque ultricies risus nec sapien aliquet maximus. Integer eget magna at urna aliquam gravida. Ut ultricies dolor a lectus lobortis, at imperdiet urna lobortis. Quisque velit massa, hendrerit nec justo pellentesque, efficitur interdum urna. Suspendisse ut condimentum lectus.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                              //Other Products
                          Container(
                            width: size.width,
                            height: 550,
                            color: Colors.grey[200],
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 20),
                                    child: Text('Other Products of this Store',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //Product Card
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: size.width * 0.45,
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: AssetImage( widget.imageUrl),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                      'Bu mağazadan daha çok ürün'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('19,99\$',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          size: 18),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: size.width * 0.45,
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: AssetImage(widget.imageUrl),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                      'Bu mağazadan daha çok ürün'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('19,99\$',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          size: 18),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: size.width * 0.45,
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              widget.imageUrl),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                      'Bu mağazadan daha çok ürün'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('19,99\$',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          size: 18),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: size.width * 0.45,
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: AssetImage(widget.imageUrl),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                      'Bu mağazadan daha çok ürün'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('19,99\$',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          size: 18),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                          //USer Name and Picture
                          Container(
                            width: size.width,
                            height: 250,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/user.jpg'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Jane Doe',
                                  style: TextStyle(fontSize: 16)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.house_outlined),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Magazayi Ziyaret Et'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.message),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Saticiya Soru Sor'),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
