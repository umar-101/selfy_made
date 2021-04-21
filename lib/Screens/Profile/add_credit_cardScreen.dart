import 'package:Selfy_made/Screens/Profile/Credit_Card.dart';
import 'package:Selfy_made/Screens/Profile/personal_info.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:Selfy_made/const.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../CustomFlatButton.dart';
import 'package:awesome_card/awesome_card.dart';


class AddCreditCard extends StatefulWidget {
  @override
  _AddCreditCardState createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
    String cardNumber = '';
    String cardHolderName = '';
    String expiryDate = '';
    String cvv = '';
    bool showBack = false;

    FocusNode _focusNode;

    @override
    void initState() {
        super.initState();
        _focusNode = FocusNode();
        _focusNode.addListener(() {
            setState(() {
                _focusNode.hasFocus ? showBack = true : showBack = false;
            });
        });
    }

    @override
    void dispose() {
        _focusNode.dispose();
        super.dispose();
    }

    TextEditingController ownerNameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController expiryDateController = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    bool isAddingCard = false;
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
                CreditCard(
                        cardNumber: cardNumber,
                        cardExpiry: expiryDate,
                        cardHolderName: cardHolderName,
                        cvv: cvv,
                        bankName: "Axis Bank",
                        cardType: CardType.masterCard, // Optional if you want to override Card Type
                        showBackSide: showBack,
                        frontBackground: CardBackgrounds.black,
                        backBackground: CardBackgrounds.white,
                        showShadow: true,
                ),
              TextFieldGrey(
                      hintText:'Kart Sahibi',
                      controller:ownerNameController,
                      isEnabled:isAddingCard ? false:true,
                      onChanged:(value){
                          setState((){
                            cardHolderName =value;
                          });
                      }
              ),
              TextFieldGrey(
                      hintText: 'Kart No',
                      controller:numberController,
                      isEnabled:isAddingCard ? false:true,
                      onChanged:(value){
                          setState((){
                            cardNumber = value;
                          });
                      }
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextFieldGrey(
                              hintText: 'Son Kullanma Tarihi',
                      controller:expiryDateController,
                      isEnabled:isAddingCard ? false:true,
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
                              isEnabled:isAddingCard ? false:true,
                              focus:_focusNode,
                              onChanged:(value){
                                  setState((){
                                      cvv = value;
                                  });
                              }
                              ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              CustomFlatButton(
                width: 70.0.w,
                height: 7.0.h,
                title: isAddingCard ? 'Verifying Card Details':'Kaydet',
                onTap: () {
                  _addCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _addCard()async{
      setState((){
          isAddingCard = true;
      });

      var response = await ApiCalls().addCard(ownerNameController.text,numberController.text,expiryDateController.text,int.parse(cvvController.text));
      setState((){
          isAddingCard = false;
      });

      print(response);
      if(response == "success"){
            FlushbarHelper.createInformation(
                    message:'Card Added Success',
                    title:"Success",
            )..show(context);
            Future.delayed(Duration(seconds:3),()=>Navigator.pop(context));
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
