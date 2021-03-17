import 'package:flutter/material.dart';
import 'package:wasila/App/Pages/chatbox.dart';
import 'package:wasila/App2/App2.dart';
import 'package:wasila/components/rounded_button.dart';
import 'package:wasila/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginEmail extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {

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
              //   child:Container(
              //     padding: EdgeInsets.only(left: 120, right: 120),
              //     child: Container(
              //       padding: EdgeInsets.all(1),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(50)),
              //         color: Color(0xff6930c3) ,
              //       ),
              //       child: Hero(
              //         tag: 'course-motion.png',
              //         child: Container(
              //           height: 100,
              //           width: 50,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.all(Radius.circular(40)),
              //               image: DecorationImage(
              //                   image: AssetImage('images/logo.png'),
              //                   fit: BoxFit.cover)),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller:messageTextController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'ادخل بريدك الالكتروني'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller:messageTextController2,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'ادخل كلمة السر'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'تسجيل الدخول',
                colour: Color(0xff6930c3),
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('email', email);
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      openChatBox();
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

                        content: Text("انت لست مشترك"),
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyHomeePage2()),
          (Route<dynamic> route) => false,
    );


  }
}