import 'package:Selfy_made/Screens/Profile/Credit_Card.dart';
import 'package:Selfy_made/Screens/Profile/update_credit_card_screen.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:Selfy_made/const.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';


class MyCards extends StatefulWidget {
    @override
    _MyCardsState createState() => _MyCardsState(); }

    class _MyCardsState extends State<MyCards> {
        List<Widget> cards = List<Widget>();
        @override
        void initState(){
            super.initState();
            _getAllCards();
        }
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                    backgroundColor: Color(0xFFF2F2F5),
                    appBar: AppBar(
                            centerTitle: true,
                            backgroundColor: kWhiteColor,
                            title: Text('Kartlarım',
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
                                    padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 20,
                                    ),
                                    child: cards.isEmpty ? Center(child:CircularProgressIndicator()):Column(
                                            children: cards,
                                    ),
                            ),
                    ),
                    );
        }
        void _getAllCards() async{
            var response = await ApiCalls().getAllCards();
            if(response.isNotEmpty){
                setState((){
                    response.forEach((card){
                        cards.add(CreditCardContainer(id:card['id'],userName:card['owner_name'],cardNumber:card['number'].toString(),deleteCard:_deleteCard,expiryDate:card['expiry_date'].toString(),cvv:card['cvv'].toString()));
                    });
                });
            }else{
                cards.add(Center(child:Text("No Cards Found")));
            }

        }
        void _deleteCard(id) async{
            var response = await ApiCalls().deleteCard(id);
            if(response['status'] == 200){
                FlushbarHelper.createInformation(
                        message:"Card Deleted Successfully",
                        title:"Success",
                )..show(context);
                setState((){
                    cards = List<Widget>();
                    _getAllCards();
                });
            }else{
                Flushbar(
                        title:"Error",
                        message:response??"Something Went Wrong",
                        backgroundColor:Colors.red,
                        duration:Duration(seconds:5),
                )..show(context);
            }

        }
    }

class CreditCardContainer extends StatelessWidget {
    final Function(String id) deleteCard;
    final int id;
    final String userName;
    final String cardNumber;
    final String expiryDate;
    final String cvv;

    const CreditCardContainer({Key key,this.expiryDate,this.cvv, this.userName,this.id, this.cardNumber,this.deleteCard})
            : super(key: key);
    @override
    Widget build(BuildContext context) {
        return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                        width: double.infinity,
                        child: Stack(children: [
                            Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Container(
                                            width: double.infinity,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                    color: kWhiteColor,
                                                    borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                                    padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
                                                    child: Row(
                                                            children: [
                                                                Column(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                            Text(userName, style: kSmallTextPrimary),
                                                                            SizedBox(height: 5),
                                                                            Text(
                                                                                    cardNumber,
                                                                                    style:
                                                                                    TextStyle(fontSize: 16, color: kPrimaryTextColor),
                                                                            ),
                                                                        ],
                                                                ),
                                                            ],
                                                    ),
                                            ),
                                            ),
                                            ),
                                            Positioned(
                                                    right: 20,
                                                    top: 13,
                                                    child: Row(
                                                            children: [
                                                                SizedBox(width: 50),
                                                                Container(
                                                                        width: 90,
                                                                        height: 45,
                                                                        decoration: BoxDecoration(
                                                                                color: kPrimaryColor,
                                                                                borderRadius: BorderRadius.circular(5)),
                                                                        child: GestureDetector(
                                                                                onTap:(){
                                                                                    deleteCard(id.toString());
                                                                                },
                                                                                child: Center(
                                                                                               child: Text(
                                                                                                       'Düzenle',
                                                                                                       style:
                                                                                                       kMediumTextPrimary.copyWith(color: Colors.white),
                                                                                               ),
                                                                                       ),
                                                                        ),
                                                                ),
                                                                GestureDetector(
                                                                        onTap:()=> Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(builder: (context) => UpdateCreditCard(id:id,ownerName:userName,number:cardNumber,expiryDate:expiryDate,cvv:cvv)),
                                                                        ),
                                                                        child: Container(
                                                                                width: 60,
                                                                                height: 45,
                                                                                decoration: BoxDecoration(
                                                                                        color: Color(0xFFED5565),
                                                                                        borderRadius: BorderRadius.circular(5)),
                                                                                child: Center(
                                                                                        child: Text(
                                                                                                'Sil',
                                                                                                style: kMediumTextPrimary.copyWith(color: Colors.white),
                                                                                        ),
                                                                                ),
                                                                        ),
                                                                ),
                                                                ],
                                                                ),
                                                                )
                                                                        ]),
                                                                        ),
                                                                        );
    }
}
