
import 'package:Selfy_made/Screens/Profile/Credit_Card.dart';
import 'package:Selfy_made/Screens/Profile/personal_info.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:Selfy_made/const.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../CustomFlatButton.dart';

class UpdateCreditCard extends StatefulWidget {
    final int id;
    final String ownerName;
    final String number;
    final String expiryDate;
    final String cvv;

    UpdateCreditCard({Key key,this.id, this.ownerName, this.number, this.expiryDate, this.cvv}) : super(key: key);
    @override
    _UpdateCreditCardState createState() => _UpdateCreditCardState();
}

class _UpdateCreditCardState extends State<UpdateCreditCard> {
    TextEditingController ownerNameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController expiryDateController = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    bool isUpdating = false;
    @override
    void initState(){
        super.initState();
        ownerNameController.text = widget.ownerName;
        numberController.text = widget.number;
        expiryDateController.text = widget.expiryDate;
        cvvController.text = widget.cvv;
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
                backgroundColor: kWhiteColor,
                appBar: AppBar(
                        centerTitle: true,
                        backgroundColor: kWhiteColor,
                        title: Text('Kart Ekle',
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
                        child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                child: Column(
                                        children: [
                                            Container(
                                                    width: double.infinity, height: 200, color: Colors.orange),
                                            TextFieldGrey(
                                                    hintText:'Kart Sahibi',
                                                    controller:ownerNameController,
                                                    isEnabled:isUpdating ? false:true
                                            ),
                                            TextFieldGrey(
                                                    hintText: 'Kart No',
                                                    controller:numberController,
                                                    isEnabled:isUpdating ? false:true,
                                            ),
                                            Row(
                                                    children: [
                                                        Expanded(
                                                                child: Container(
                                                                        height: 50,
                                                                        child: TextFieldGrey(
                                                                                hintText: 'Son Kullanma Tarihi',
                                                                                controller:expiryDateController,
                                                                                isEnabled:isUpdating ? false:true,
                                                                        ),
                                                                ),
                                                        ),
                                                        SizedBox(width: 20),
                                                        Expanded(
                                                                child: Container(
                                                                        height: 50,
                                                                        child: TextFieldGrey(
                                                                                hintText: 'CVV',
                                                                                controller:cvvController,
                                                                                isEnabled:isUpdating ? false:true,

                                                                        ),
                                                                ),
                                                        )
                                                                ],
                                                                ),
                                                                SizedBox(height: 20),
                                                                CustomFlatButton(
                                                                        width: 70.0.w,
                                                                        height: 7.0.h,
                                                                        title: isUpdating ? 'Updating Card Details':'Kaydet',
                                                                        onTap: () {
                                                                            _updateCard();
                                                                        },
                                                                ),
                                                                ],
                                                                ),
                                                                ),
                                                                ),
                                                                );
    }
    void _updateCard()async{
        setState((){
            isUpdating = true;
        });

        var response = await ApiCalls().updateCard(widget.id.toString(),ownerNameController.text,numberController.text,expiryDateController.text,cvvController.text);
        setState((){
            isUpdating = false;
        });

        if(response['status'] == 200){
            FlushbarHelper.createInformation(
                    message:response['message'],
                    title:"Success",
            )..show(context);
            Future.delayed(Duration(seconds:3),()=>Navigator.pop(context,));
        }else{
            Flushbar(
                    title:"Error",
                    message:response['message']??"Something Went Wrong",
                    backgroundColor:Colors.red,
                    duration:Duration(seconds:5),
            )..show(context);
        }
    }
}
