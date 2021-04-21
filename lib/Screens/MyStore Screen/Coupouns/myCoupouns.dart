import 'package:Selfy_made/Screens/MyStore%20Screen/Coupouns/createCoupoun.dart';
import 'package:Selfy_made/Screens/Profile/Credit_Card.dart';
import 'package:Selfy_made/const.dart';
import 'package:flutter/material.dart';

class MyCoupouns extends StatefulWidget {
  @override
  _MyCoupounsState createState() => _MyCoupounsState();
}

class _MyCoupounsState extends State<MyCoupouns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F5),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Kartlarım',
              style: kMediumTextPrimary.copyWith(fontSize: 18)),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreditCardScreen()),
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
            SizedBox(height: 15),
            CreditCardContainer(
              userName: 'Düşük Fazili Kartım',
            ),
            CreditCardContainer(
              userName: 'Bonus Kartım ',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 40, 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateCoupoun()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Yeni Kupon Oluştur',
                      style: kMediumTextPrimary.copyWith(color: kWhiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardContainer extends StatelessWidget {
  final String userName;

  const CreditCardContainer({
    Key key,
    this.userName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text(userName, style: kSmallTextPrimary),
              Spacer(),
              Container(
                width: 60,
                height: 45,
                decoration: BoxDecoration(
                    color: Color(0xFFED5565),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'Sil',
                    style: kMediumTextPrimary.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
