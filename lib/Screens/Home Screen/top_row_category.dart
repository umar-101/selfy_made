import 'package:Selfy_made/Screens/Story%20Screen/Story.dart';
import 'package:Selfy_made/Screens/Story%20Screen/data.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class CategoryRow extends StatelessWidget {
  final String title;
  final String iconUrl;

  const CategoryRow({Key key, this.iconUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      child: Column(
        children: [
          GestureDetector(
                  onTap:(){
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                      builder: (context) => StoryScreen(stories:stories)),
                      );
                  },
                  child: Container(
                                 height: 70,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kPrimaryColor, width: 2)),
              child: Center(
                child: Image(
                  image: AssetImage(iconUrl),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(color: kPrimaryTextColor)),
        ],
      ),
    );
  }
}
