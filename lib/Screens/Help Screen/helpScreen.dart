import 'package:Selfy_made/Screens/Home%20Screen/home.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          backgroundColor: kWhiteColor,
          title: Text('Yardım', style: kMediumTextPrimary),
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
              color: kPrimaryColor,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              ArticleWidget(),
              Divider(thickness: .3, color: kPrimaryTextColor),
              ArticleWidget(),
              Divider(thickness: .3, color: kPrimaryTextColor),
              ArticleWidget(),
              Divider(thickness: .3, color: kPrimaryTextColor),
              ArticleWidget(),
              Divider(thickness: .3, color: kPrimaryTextColor),
            ],
          ),
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String body;

  Article({this.title, this.body});
}

List<Article> articles = [
  Article(
      title: 'This is a title',
      body:
          'This is a title.This is a title. ji ja and bery anghty how are  you and we hav ebeeb anl alidf ekrale fal ekfasd flwief aslkfh asldkf This is a titleThis is a titleThis is a titleThis is a titleThis is a titleThis is a title'),
];

class ArticleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          articles[0].title,
          style: kMediumTextPrimary.copyWith(fontSize: 17),
        ),
      ),

      expanded: Text(
        articles[0].body,
        style: TextStyle(fontSize: 18, color: kPrimaryTextColor, height: 1.3),
        softWrap: true,
      ),
      // ignore: deprecated_member_use
      tapHeaderToExpand: true,
      // ignore: deprecated_member_use
      hasIcon: true,
    );
  }
}
