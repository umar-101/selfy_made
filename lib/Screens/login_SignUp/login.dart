import 'package:Selfy_made/Screens/login_SignUp/signup.dart';
import 'package:Selfy_made/Screens/login_SignUp/password_field.dart';
import 'package:Selfy_made/Screens/login_SignUp/text_field.dart';
import 'package:Selfy_made/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

import '../../api_calls.dart';
import '../../const.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _isAuthenticated();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVerifying = false;
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: isAuthenticated
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [kPrimaryColor, Color(0xFFAED8D8)])),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/app logo.png'),
                            width: 120,
                            height: 120),
                        SizedBox(height: 30),
                        TextFieldWidget(
                          hintText: 'E-Posta',
                          isEnabled: isVerifying ? false : true,
                          textController: emailController,
                        ), //email
                        SizedBox(height: 10),
                        PasswordFieldWidget(
                          hintText: 'Şifre',
                          textController: passwordController,
                          isEnabled: isVerifying ? false : true,
                        ), //password
                        SizedBox(height: 30),
                        Container(
                          width: 180,
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              _validateUserDetails();
                            },
                            child: Center(
                              child: isVerifying == true
                                  ? Text('Verifying Details...')
                                  : Text(
                                      'Giriş Yap',
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
                              'Bir hesabın yok mu? ',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text(
                                'Kayıt Ol.',
                                style: kSmallTextWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void _validateUserDetails() async {
    setState(() {
      isVerifying = true;
    });

    var response;
    try {
      response = await ApiCalls()
          .validateUserDetails(emailController.text, passwordController.text);
    } on Exception catch (ex) {
      response = ex.toString();
    }
    print(response);

    setState(() {
      isVerifying = false;
    });
    if (response == "success") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_context) => MainScreen()),
      );
    } else {
      Flushbar(
        title: "Error",
        message: response ?? "Something Went Wrong",
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      )..show(context);
    }
  }

  Future<bool> _isAuthenticated() async {
    bool response = await ApiCalls().isAuthenticated();
    setState(() {
      isAuthenticated = response;
    });
    if (response == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_context) => MainScreen()),
      );
    }
  }
}
