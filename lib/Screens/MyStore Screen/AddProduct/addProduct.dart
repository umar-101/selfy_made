import 'dart:io';

import 'package:Selfy_made/CustomFlatButton.dart';
import 'package:Selfy_made/Screens/MyStore%20Screen/myStore.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../const.dart';
import 'flatButtonsRow.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool checkedValue = false;
  bool isPublishing = false;
  final ImagePicker picker = ImagePicker();
  File image;

  List<Widget> features = List<Widget>();
  TextEditingController titleController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController piecesController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController featureController = TextEditingController();
  TextEditingController featureNameController = TextEditingController();
  TextEditingController cargoNameController = TextEditingController();
  TextEditingController cargoCostController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text('Ürün Ekle', style: kMediumTextPrimary), //My Store
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ürün Fotoğrafı Ekle', style: kMediumTextPrimary),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('Ürün başlığı', style: kMediumTextPrimary),
              TextField(
                enabled: isPublishing == true ? false : true,
                controller: titleController,
                style: TextStyle(color: kPrimaryTextColor),
                cursorColor: kPrimaryTextColor,
                decoration:
                    buildInputDecoration().copyWith(hintText: 'Ürün bilgisi'),
              ),
              TextField(
                enabled: isPublishing == true ? false : true,
                controller: explanationController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Ürün Açıklaması'),
              ),
              TextField(
                enabled: isPublishing == true ? false : true,
                controller: categoryController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration().copyWith(
                    hintText:
                        'Ürün Kategorisi Seçimi'), //Product Category Choosing
                //add popup alert for choosing
              ),
              TextField(
                enabled: isPublishing == true ? false : true,
                controller: codeController,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
                cursorColor: kPrimaryTextColor,
                decoration: buildInputDecoration()
                    .copyWith(hintText: 'Ürün Kodu'), //Product Code
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: piecesController,
                      style: TextStyle(
                        color: kPrimaryTextColor,
                      ),
                      cursorColor: kPrimaryTextColor,
                      decoration: buildInputDecoration()
                          .copyWith(hintText: 'Adet'), //PCS
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      enabled: isPublishing == true ? false : true,
                      controller: costController,
                      style: TextStyle(
                        color: kPrimaryTextColor,
                      ),
                      cursorColor: kPrimaryTextColor,
                      decoration: buildInputDecoration()
                          .copyWith(hintText: 'Fiyat'), //Cost
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      enabled: isPublishing == true ? false : true,
                      controller: cargoNameController,
                      style: TextStyle(
                        color: kPrimaryTextColor,
                      ),
                      cursorColor: kPrimaryTextColor,
                      decoration: buildInputDecoration()
                          .copyWith(hintText: 'Kargo Adi'), //Cargo name
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                      enabled: isPublishing == true ? false : true,
                      controller: cargoCostController,
                      style: TextStyle(
                        color: kPrimaryTextColor,
                      ),
                      cursorColor: kPrimaryTextColor,
                      decoration: buildInputDecoration()
                          .copyWith(hintText: 'Fiyat'), //Cargo Cost
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text('Ürün Özellikleri', style: kMediumTextPrimary),
              SizedBox(height: 10),
              Column(
                      children:features
              ),
              SizedBox(height: 10),

              Row(
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
                                  child: FlatButton(
                                          height: 45,
                                          child:Text('Bir Özellik Daha'),
                                          onPressed: ()=>_addFeature(),
                                  ),
                          ),
                      ],
              ),
 //FlatButtonsRow(
                //addFeature: () =>_addFeature
                //,
              //),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Kişiye Özel', style: kMediumTextPrimary),
                  Spacer(),
                  Text("Yapilabilir",
                      style: TextStyle(color: kPrimaryTextColor)),
                  Transform.scale(
                    scale: .7,
                    child: Checkbox(
                      // checkColor: kPrimaryColor,
                      activeColor: kPrimaryColor,
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                    ),
                  ),
                  Text("Yapilamaz", style: TextStyle(color: kPrimaryTextColor)),
                  Transform.scale(
                    scale: .7,
                    child: Checkbox(
                      activeColor: kPrimaryColor,
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Kişiye Özel', style: kMediumTextPrimary),
                  Spacer(),
                  Text("Yapilabilir",
                      style: TextStyle(color: kPrimaryTextColor)),
                  Transform.scale(
                    scale: .7,
                    child: Checkbox(
                      // checkColor: kPrimaryColor,
                      activeColor: kPrimaryColor,
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                    ),
                  ),
                  Text("Yapilamaz", style: TextStyle(color: kPrimaryTextColor)),
                  Transform.scale(
                    scale: .7,
                    child: Checkbox(
                      activeColor: kPrimaryColor,
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              CustomFlatButton(
                width: double.infinity,
                height: 50,
                title: isPublishing ? 'Publishing...' : 'Yayinla',
                onTap: () {
                  _addProduct();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _addFeature() {
    Widget row = Row(
      children: [
        TextField(
          controller: featureNameController,
          style: TextStyle(
            color: kPrimaryTextColor,
          ),
          cursorColor: kPrimaryTextColor,
          decoration: buildInputDecoration().copyWith(
              hintText:
                  'Özellik Adı Ekle (örn: renk)'), //Add Feature name example:color
        ),
        TextField(
          controller: featureController,
          style: TextStyle(
            color: kPrimaryTextColor,
          ),
          cursorColor: kPrimaryTextColor,
          decoration: buildInputDecoration()
              .copyWith(hintText: 'Özellikler ekleyin (örnek: sarı yeşil)'),
        ),
      ],
    );
    setState(() {
      features.add(row);
    });
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: 'Urun Basligi', // email
      hintStyle: TextStyle(color: kPrimaryTextColor, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryTextColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryTextColor),
      ),
    );
  }

  void _addProduct() async {
    setState(() {
      isPublishing = true;
    });

    List images = List();
    images.add((image != null ? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last) : null));
    var data = FormData.fromMap({
      'title': titleController.text,
      'explanation': explanationController.text,
      'category': categoryController.text,
      'code': int.parse(codeController.text),
      'pieces': piecesController.text,
      'cost': costController.text,
      'cargo_name': cargoNameController.text,
      'cargo_cost': cargoCostController.text,
      'images': images,
      'cart_id':1
    });

    var response = await ApiCalls().addProduct(data);
    setState(() {
      isPublishing = false;
    });

    if (response["status"] == 200) {
      FlushbarHelper.createInformation(
        message: response['message'],
        title: "Success",
      )..show(context);
      Future.delayed(
          Duration(seconds: 3),
          () => Navigator.pop(
                context,
              ));
    } else {
      Flushbar(
        title: "Error",
        message: response['message'] ?? "Something Went Wrong",
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      )..show(context);
    }
  }
}
