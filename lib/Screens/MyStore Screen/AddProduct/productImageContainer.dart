import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';

class ProductAddImageContainer extends StatefulWidget {
  @override
  _ProductAddImageContainerState createState() =>
      _ProductAddImageContainerState();
}

class _ProductAddImageContainerState extends State<ProductAddImageContainer> {
  File image;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.0.w,
      height: 12.0.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: kPrimaryTextColor)),
      child: Center(
        child: image == null
            ? IconButton(
                icon: Icon(Icons.camera_enhance_rounded),
                onPressed: _getImage,
                color: kPrimaryColor,
              )
            : Image.file(image),
      ),
    );
  }

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        return image;
      } else {
        print('No image selected.');
      }
    });
  }
}
