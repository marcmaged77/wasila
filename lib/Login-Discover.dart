import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wasila/App/Pages/ProfileScreen.dart';
import 'package:wasila/email/LoginUI.dart';
import 'package:wasila/email/loginE.dart';
import 'package:wasila/email/registerR.dart';
import 'package:wasila/email/registerUI.dart';
import 'CoursePage.dart';
import 'sign in/sign_in_google.dart';
import 'sign in/Facebook.dart';
import 'App/DesignCourse.dart';
import 'App/App.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,

      debugShowCheckedModeBanner:
          false, // to remove the debug banner on top of the screen
      theme: ThemeData(fontFamily: 'head'),

      home: mainPage(),
    );
  }
}





class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6930c3),
      body:


      ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 30, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              /////////////////////////////////header welcome and logo////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'مرحبا بك..',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      width: 100,
                      child: Image.asset('images/logo.png')),
                ],
              ),

              /////////////////////////////////////////header welcome logo ////////////////////////////////////////////

              Divider(color: Colors.white,),

SizedBox(height: 20,),


              //////////////////////////////////////////////////////////////////////////top body /////////////////////////////////////////////////////////////////////////////////////////////////


              Text(
                'مسارات وسيلة\n نقدم لك العديد من المسارات التي تساعدك على البداية والتقدم في أي مجال تهتم به مثل تصميم الجرافيك والموشن جرافيك وغيرها.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),


              //////////////////////////////////////////////////////////////////////////top body /////////////////////////////////////////////////////////////////////////////////////////////////


              SizedBox(height: 70),




///////////////////////////////////////////////////////////////////////////////////////////////// login and explore buttons/////////////////////////////////////////////////////////////////////////////////////////////
              Expanded(
                  child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 70),



                            browse('  تعرف علي الدورات  ', Color(0xffff6a65),
                                Color(0xffff5954)),


                            SizedBox(height: 30),


                            signIn('تسجيل الدخول', Color(0xffff6a65),
                                Color(0xffff5954)),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              ),
              ///////////////////////////////////////////// login and explore buttons///////////////////////////



            ],
          ),
        ),
      ),
    );
  }

  Container browse(String category, Color categoryColor, Color bgColor) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: InkWell(
            onTap: () {
              openCoursePage();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: categoryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('$category',
                      style: TextStyle(
                          color: (categoryColor == Color(0xffe9eefa)
                              ? Color(0xff2657ce)
                              : Colors.white))),
                )
              ],
            )));
  }

  Container signIn(String category, Color categoryColor, Color bgColor) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: InkWell(


            onTap: () {
              _bottomSheet(context);
              // _modalBottomSheetMenu();
            },




            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: categoryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child:

                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20),

                    child: Text('$category',
                        style: TextStyle(
                            color: (categoryColor == Color(0xffe9eefa)
                                ? Color(0xff2657ce)
                                : Colors.white))),
                  ),
                )
              ],
            )));
  }




  //for test
  void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 500.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(50.0),
                        topRight: const Radius.circular(50.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        }
    );
  }


_bottomSheet(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){
      return Container(
          height: 350.0,
        child:
      //     new Container(
      //     decoration: new BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: new BorderRadius.only(
      //     topLeft: const Radius.circular(10.0),
      // topRight: const Radius.circular(10.0))),
      // child:

         Container(
          decoration: new BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),

           child:




           Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[


              Padding(
                padding:  EdgeInsets.all(12.0),
                child: Text('تسجيل الدخول', style: TextStyle(fontSize: 20),),
              ),
              Divider(
                height: 20,
              ),
              // ButtonBar(
              //   alignment: MainAxisAlignment.spaceEvenly,
              //   children: <Widget>[
              //     RaisedButton(
              //
              //       child: const Text('RaisedButton'),
              //     ),
              //     const RaisedButton(
              //       onPressed: null,
              //       child: Text('disabled-RaisedButton'),
              //     ),
              //   ],
              // ),


              ListTile(
                 leading: Image.asset('images/google.png',height: 40,),
                title: Text('تسجيل الدخول عبر جوجل', style: TextStyle(fontSize:14) ),
    onTap:  () {
                   setState(() {
                     showSpinner = true;
                   });
      signInWithGoogle().then((result) {
        if (result != null) {

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyHomeePage()),
                (Route<dynamic> route) => false,
          );
setState(() {
  showSpinner = false;
});
        }
      });
    },
                trailing: Icon(Icons.login),

              ),


              Divider(
                height: 20,
              ),


              ListTile(
                leading: Image.asset('images/emaill.png',height: 35,),
                title: Text('تسجيل الدخول عبر البريد الإلكتروني', style: TextStyle(fontSize:14) ),
                onTap: () {
                  openLoginScreen();
                },
                trailing: Icon(Icons.login),
                // trailing: ElevatedButton(
                //   onPressed:() => openCoursePage() ,
                //   child: Text('Sign In' ),
                //
                // ),
              ),
              Divider(
                height: 20,
              ),
        ListTile(
        leading: Image.asset('images/emaill.png',height: 35,),
          title: Text('انشاء بريد إلكتروني جديد', style: TextStyle(fontSize:14) ),
          onTap: () {
            openRegisterScreen();
          },
          trailing: Icon(Icons.login),
          // trailing: ElevatedButton(
          //   onPressed:() => openCoursePage() ,
          //   child: Text('Sign In' ),
          //
          // ),
          ),

            ]
          ),
        )
      );
    }

    );
}


  void openCoursePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return coursePage();
    }));
  }


  void openHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Profile();
    }));
  }

  void openApp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyHomeePage();
    }));


  }
  void openLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginEmaill();
    }));


  }
  void openRegisterScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Register();
    }));


  }

}
