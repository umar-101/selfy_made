import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';

class BillCardContainer extends StatelessWidget {
  const BillCardContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45.0.h,
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
            child: Row(
              children: [
                Text('Adet',
                    style:
                        kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
                SizedBox(width: 5.0.w),
                Text('Ürün',
                    style:
                        kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
                Spacer(),
                Text('Tutar',
                    style:
                        kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
                SizedBox(width: 5.0.w),
                Text('Toplam',
                    style:
                        kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
              ],
            ),
          ),
          SizedBox(height: 3.0.w),
          Container(
            height: 17.0.h,
            decoration: BoxDecoration(
              color: kScaffoldColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemPurchased(
                    quantity: ' 1 ',
                    name: 'Portre',
                    amount: '100₺',
                    totalAmount: '100₺',
                  ),
                  ItemPurchased(
                    quantity: ' 1 ',
                    name: 'Kokulu Sabun',
                    amount: '100₺',
                    totalAmount: '100₺',
                  ),
                  ItemPurchased(
                    quantity: ' 1 ',
                    name: 'Kartvizit 1000’li Baskı 0.3mmx12cmx8cm',
                    amount: '100₺',
                    totalAmount: '100₺',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                TaxRow(
                  taxName: 'Ara Toplam',
                  amount: '300₺',
                ),
                TaxRow(
                  taxName: 'Kargo',
                  amount: '0₺',
                ),
                TaxRow(
                  taxName: 'KDV',
                  amount: '%18',
                ),
                TaxRow(
                  taxName: 'Toplam',
                  amount: '354₺',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TaxRow extends StatelessWidget {
  final String taxName;
  final String amount;
  const TaxRow({
    Key key,
    this.taxName,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(65, 5, 25, 10),
      child: Row(
        children: [
          Text(taxName,
              style: kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
          Spacer(),
          Text(amount,
              style: kSmallTextPrimary.copyWith(color: kPrimaryTextColor)),
        ],
      ),
    );
  }
}

class ItemPurchased extends StatelessWidget {
  final String quantity;
  final String name;
  final String amount;
  final String totalAmount;
  const ItemPurchased({
    Key key,
    this.quantity,
    this.name,
    this.amount,
    this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      child: Row(
        children: [
          Text(quantity,
              textAlign: TextAlign.center,
              style: TextStyle(color: kPrimaryTextColor)),
          SizedBox(width: 5.0.w),
          Expanded(
            child: Text(name,
                maxLines: 2,
                style: TextStyle(
                  color: kPrimaryTextColor,
                )),
          ),
          Spacer(),
          Text(amount, style: TextStyle(color: kPrimaryTextColor)),
          SizedBox(width: 5.0.w),
          Text(totalAmount, style: TextStyle(color: kPrimaryTextColor)),
        ],
      ),
    );
  }
}
