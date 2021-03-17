import 'package:flutter/material.dart';
import 'package:wasila/App/Pages/chatbox.dart';
import 'package:wasila/App2/App2.dart';
import 'package:wasila/components/rounded_button.dart';
import 'package:wasila/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasila/email/registerUI.dart';




class LoginEmaill extends StatefulWidget {
  @override
  _LoginEmaillState createState() => _LoginEmaillState();
}

class _LoginEmaillState extends State<LoginEmaill> {
  final _auth = FirebaseAuth.instance;

  final messageTextController = TextEditingController();
  final messageTextController2 = TextEditingController();


  bool showSpinner = false;

  String email;
  String password;




  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xff6930c3),
          title: Text('تسجيل الدخول '),
        elevation: 0,),
        backgroundColor:Color(0xff6930c3),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children : <Widget>[


              Container(
                decoration: BoxDecoration(
                  color: Color(0xffd3e0ea),
                  borderRadius: BorderRadius.all(Radius.circular(30)),

                ),
                padding: EdgeInsets.only(right: 40, left: 40, top: 50,),
                child: Column(



                  children: <Widget>[


                    // Text('البريد الإلكتروني',
                    //     style: TextStyle(
                    //       color: Colors.black.withOpacity(0.6),
                    //     )),



                    TextFormField(
                      decoration: InputDecoration(labelText: 'أدخل بريدك الإلكتروني'),style: TextStyle(color: Colors.black.withOpacity(0.7),),
                      controller:messageTextController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                    ),


                    SizedBox(
                      height: 20,
                    ),



                    // Text('Password',
                    //     style: TextStyle(
                    //       color: Colors.black.withOpacity(0.6),
                    //     )),


                    TextFormField(
                      decoration:
                      InputDecoration(labelText: 'ادخل كلمة السر'),style: TextStyle(color: Colors.black.withOpacity(0.7)),
                      controller:messageTextController2,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),







                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
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
                          child: const Text('تسجيل الدخول',
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),

                    ),
                    SizedBox(
                      height: 10,
                    ),




                    Center(
                      child: TextButton(
                        onPressed: (){
                          openRegister() ;
                        },

                        child: Container(
                          child:  Text('انشاء بريد الكتروني جديد ؟',style: TextStyle(color: Colors.blue.withOpacity(0.8)),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),]
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
  void openRegister(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return Register();
    }));


  }
}
