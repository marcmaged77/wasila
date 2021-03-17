import 'package:flutter/material.dart';
import 'package:wasila/App/Pages/chatbox.dart';
import 'package:wasila/components/rounded_button.dart';
import 'package:wasila/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wasila/email/loginE.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  final messageTextController2 = TextEditingController();


  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Text('تسجيل الدخول '),),

      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Flexible(
              //   child: Hero(
              //     tag: 'logo',
              //     child: Container(
              //       height: 200.0,
              //       child: Image.asset('images/logo.png'),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: messageTextController2,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'ادخل البريد الإلكتروني الجديد'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: messageTextController,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'ادخل كلمة سر جديدة'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'انشاء حساب',
                colour: Color(0xff6930c3),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      openLoginScreen();
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpinner = false;
                    });
                    clearText();
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(

                        content: Text("انت بالفعل مشترك"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("حسنا"),
                          ),
                        ],
                      ),
                    );


                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void clearText(){
    messageTextController.clear();
    messageTextController2.clear();

  }
  void openChatBox(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return ChatScreen();
    }));
  }
  void openLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginEmail();
    }));


  }
}