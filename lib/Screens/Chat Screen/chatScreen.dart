import 'dart:async';

import 'package:Selfy_made/Screens/Chat%20Screen/contactScreen.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../const.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
    List<Widget> messages = List<Widget>();
    TextEditingController messageController = TextEditingController();
    ScrollController scrollController = ScrollController();
    bool isLoading = false;

    //@override
    //void didChangeDependencies(){
        //super.didChangeDependencies();
        //_getAllMessages();
    //}
    @override
    void initState(){
        super.initState();
        _getAllMessages();
    }
  @override
  Widget build(BuildContext context) {
      Timer(
              Duration(seconds: 1),
              () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
      );

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('John',
              style: kMediumTextPrimary.copyWith(color: kWhiteColor)),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kWhiteColor,
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: isLoading == true ? CircularProgressIndicator() :ListView.builder(
                    controller:scrollController,
                    shrinkWrap: true,
                    itemCount:messages.length,
                    itemBuilder:(context,index){
                            return messages[index];
                    },
            ),
          ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 10.0.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0xFFE5E5EA),
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 70.0.w,
                                height: 7.0.h,
                                child: TextField(
                                        controller:messageController,
                                  maxLines: 1000,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Your Message', // email
                                    hintStyle: TextStyle(
                                      color: kPrimaryTextColor,
                                      fontSize: 11.0.sp,
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: kWhiteColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: kWhiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.camera_alt,
                              size: 20.0.sp,
                              color: kPrimaryColor,
                            ),
                            IconButton(
                                    onPressed:()=>_sendMessage(messageController.text),
                                    icon: Icon(
                                            Icons.send,
                                            size: 20.0.sp,
                                            color: kPrimaryColor,
                                    ),
                            )
                          ],
                        ),
                      )
                              )),
        ],
      ),
    );
  }
  void _getAllMessages()async{
      var response = await ApiCalls().getChatMessages();
      setState((){
          isLoading = true;

          response.forEach((message){
              messages.add(Message(message:message['message'],isSender:message['is_sender'] == 1 ? true:false));
          });
          isLoading = false;
      });
  }
  void _sendMessage(message)async{
      var response = await ApiCalls().sendChatMessage(message);
      if(response['status'] == 200){
          messageController.clear();
          _getAllMessages();
      }
  }
}

class Message extends StatelessWidget {
    final String message;
    final bool isSender;

    const Message({Key key, this.message,this.isSender=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      if(isSender == true){
          return Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                          child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  width: 50.0.w,
                                  decoration: BoxDecoration(
                                          color: Color(0xFFE5E5EA),
                                          borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(16),
                                                  bottomRight: Radius.circular(16),
                                                  topLeft: Radius.circular(16),
                                          )),
                                  child: Expanded(
                                          child: Text(
                                                  message,
                                                  style:
                                                  TextStyle(color: kBlackColor, fontSize: 11.0.sp))),
                          ),
                  ),
                  );
      }else{
          return Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                          child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  width: 50.0.w,
                                  decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(16),
                                                  bottomLeft: Radius.circular(16),
                                                  topLeft: Radius.circular(16),
                                          )),
                                  child: Expanded(
                                          child: Text(
                                                  message,
                                                  style: TextStyle(color: kWhiteColor, fontSize: 11.0.sp)),
                                  ),
                          ),
                  ),
                  );
      }
  }

}
