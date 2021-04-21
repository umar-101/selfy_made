import 'package:Selfy_made/Screens/Home%20Screen/data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../const.dart';

class GridProducts extends StatelessWidget {
  const GridProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 350,
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 2.0.w,
            crossAxisSpacing: 2.0.w,
            childAspectRatio: 0.2.w,
          ),
          itemBuilder: (context, index) {
            return Expanded(
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Colors.grey[300],
                          offset: Offset(0.1, 1))
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                          fit: BoxFit.fill,
                          width: 200,
                          height: 140,
                          image: AssetImage(
                            products[index].imageUrl,
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 7, left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              products[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: false,
                              style: TextStyle(color: kPrimaryTextColor),
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
        ),
      ),
    );
  }
}
