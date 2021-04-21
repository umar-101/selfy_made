import 'package:flutter/material.dart';

import '../../../CustomFlatButton.dart';

class FlatButtonsRow extends StatefulWidget {
    final Function addFeature;
    FlatButtonsRow({
        Key key, this.addFeature,
    }) : super(key: key);

  @override
  _FlatButtonsRowState createState() => _FlatButtonsRowState();
}

class _FlatButtonsRowState extends State<FlatButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomFlatButton(
            width: double.infinity,
            height: 45,
            title: 'Kayıt',
            onTap: () {},
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: CustomFlatButton(
            width: double.infinity,
            height: 45,
            title: 'Bir Özellik Daha',
            onTap: ()=>widget.addFeature,
          ),
        ),
      ],
    );
  }
}
