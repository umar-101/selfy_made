import 'package:Selfy_made/Screens/login_SignUp/password_field.dart';
import 'package:Selfy_made/Screens/login_SignUp/text_field.dart';
import 'package:Selfy_made/api_calls.dart';
import 'package:Selfy_made/mainScreen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    var isRegistering = false;
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor, Color(0xFFAED8D8)])),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/app logo.png'),
                      width: 120,
                      height: 120),

                  SizedBox(height: 20),
                  TextFieldWidget(
                          textController:usernameController,
                          isEnabled:isRegistering?false:true,
                          hintText: 'Kullanıcı Adı'
                  ), //user name
                  SizedBox(height: 10),
                  TextFieldWidget(
                          textController:emailController,
                          isEnabled: isRegistering ? false:true,
                          hintText: 'E-Posta'
                          ), //email
                  SizedBox(height: 10),
                  PasswordFieldWidget(
                          textController:passwordController,
                          isEnabled:isRegistering?false:true,
                          hintText: 'Şifre'
                  ), //password
                  SizedBox(height: 10),
                  PasswordFieldWidget(
                          textController:confirmPasswordController,
                          isEnabled:isRegistering?false:true,
                          hintText: 'Şifre(Tekrar)'
                  ), //Repeat Password
                  SizedBox(height: 30),
                  GestureDetector(
                          onTap:()=>_handleSignUp(),
                    child: Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                    child: Text(
                                            isRegistering ? 'Registering':'Kayıt Ol',
                                            style: kSmallTextPrimary,
                                    ),
                            ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Zaten bir hesabın mı var?  ',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                            Navigator.pop(context);
                        },
                        child: Text(
                          'Giriş Yap.',
                          style: kSmallTextWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
  void _handleSignUp() async{
          setState((){
            isRegistering = true;
        });

        var response;
        try{
            response = await ApiCalls().register(emailController.text,passwordController.text,confirmPasswordController.text,usernameController.text);
        }on Exception catch(ex){
            response = ex.toString();
        }

        setState((){
            isRegistering = false;
        });
        if(response == "success"){
            Navigator.pop(context);
            Flushbar(
                    title:"Success",
                    message:"Please Login To Continue",
                    backgroundColor:Colors.green,
                    duration:Duration(seconds:5),
            )..show(context);
        }else{
            Flushbar(
                    title:"Error",
                    message:response ?? "",
                    backgroundColor:Colors.red,
                    duration:Duration(seconds:5),
            )..show(context);
        }
}
}
