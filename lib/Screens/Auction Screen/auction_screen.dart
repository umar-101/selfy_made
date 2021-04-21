import 'package:flutter/material.dart';

class AuctionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/image1.png",
      "assets/images/image2.png",
      "assets/images/image3.png",
      "assets/images/image4.png",
      "assets/images/image5.png",
      "assets/images/image6.png",
      "assets/images/image7.jpg",
      "assets/images/download.jpg",
      "assets/images/download.jpg",
      "assets/images/download.jpg",
      "assets/images/download.jpg",
      "assets/images/download.jpg",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'voici votre article, vous pouvez la cheter',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            height: 1.5,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Align(
                        //   alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 25,
                          width: 90,
                          child: ElevatedButton(
                            child: Text('Bonjure!'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green[900]),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(
            images.length,
            (index) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(images[index]),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 25,
                      width: 90,
                      child: ElevatedButton(
                        child: Text('Bonjure!'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green[900]),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
