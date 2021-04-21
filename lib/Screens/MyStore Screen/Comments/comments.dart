import 'package:Selfy_made/Screens/MyStore%20Screen/Coupouns/createCoupoun.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../const.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Yorumlarım', style: kMediumTextPrimary), //My Store
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyStoreScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '26 Ürün Yorumu',
                    style: TextStyle(color: kPrimaryTextColor),
                  ),
                  SizedBox(width: 10),
                  RatingStars(),
                  RatingStars(),
                  RatingStars(),
                  RatingStars(),
                  RatingStars(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 60.0.h,
              decoration: BoxDecoration(
                color: kWhiteColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(children: [
                  UpperContainer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.08,
                            backgroundColor: kPrimaryTextColor,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: kPrimaryTextColor),
                              cursorColor: kPrimaryTextColor,
                              decoration: buildInputDecoration()
                                  .copyWith(hintText: 'Cevap Yaz'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 40,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryLightColor,
                        ),
                        child: Center(
                          child: Text(
                            'Gönder',
                            style:
                                kMediumTextPrimary.copyWith(color: kWhiteColor),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: kPrimaryTextColor,
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Yazan', style: TextStyle(color: kPrimaryTextColor)),
                  Spacer(),
                  Text('15.07.2021',
                      style: TextStyle(color: kPrimaryTextColor)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('alidesidero', style: kMediumTextPrimary),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      RatingStars(),
                      RatingStars(),
                      RatingStars(),
                      RatingStars(),
                      RatingStars(),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Beklediğimden çok daha iyi bir ürün çıktı. Hızlı kargo içinde ayrıca teşekkür ederim.',
                    style: TextStyle(color: kPrimaryTextColor, height: 1.4),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        width: 110,
                        height: 100,
                        image: AssetImage('assets/images/image6.png'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Sprey Boya %100 \nAkrilik Mat Beyaz',
                            style: kSmallTextPrimary.copyWith(height: 1.4),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star, size: 20, color: Color(0xFFFA9805));
  }
}
