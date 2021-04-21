import 'package:Selfy_made/api_calls.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import 'package:sizer/sizer.dart';

import 'categoriesSearch.dart';
import 'productSearch.dart';

List ob = [];

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          children: [
            SearchFieldContainer(),
            SizedBox(height: 5.0.h),
            _isSearch
                ? Container(
                    child: ListView.builder(
                        itemCount: ob.length,
                        itemBuilder: (_, index) {
                          return Text(ob[index]['title']);
                        }),
                  )
                : Column(
                    children: [
                      SearchCategoryRow(
                        title: 'Ürünler',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductSearch()),
                          );
                        },
                      ),
                      DividerContainer(),
                      SearchCategoryRow(
                        title: 'Mağazalar',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesSearch()),
                          );
                        },
                      ),
                      DividerContainer(),
                      SearchCategoryRow(
                        title: 'Kategoriler',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesSearch()),
                          );
                        },
                      ),
                      DividerContainer(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class DividerContainer extends StatelessWidget {
  const DividerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(height: 0.4, color: kPrimaryTextColor),
    );
  }
}

class SearchCategoryRow extends StatelessWidget {
  final String title;
  final Function onTap;

  const SearchCategoryRow({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        Text(title,
            style: TextStyle(
              color: kBlueColor,
              fontSize: 11.0.sp,
            )),
        Spacer(),
        (Icon(Icons.arrow_forward_ios,
            size: 10.0.sp, color: kPrimaryTextColor)),
      ]),
    );
  }
}

class SearchFieldContainer extends StatefulWidget {
  const SearchFieldContainer({
    Key key,
  }) : super(key: key);

  @override
  _SearchFieldContainerState createState() => _SearchFieldContainerState();
}

class _SearchFieldContainerState extends State<SearchFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF0F1F5),
      ),
      child: TextField(
        onChanged: (value) async {
          if (value.length > 2) {
            ob = await ApiCalls().searchImpl(value);
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kBlackColor,
        ),
        cursorColor: kBlackColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 16.0.sp),
          border: InputBorder.none,
          hintText: 'Ara',
        ),
      ),
    );
  }
}
