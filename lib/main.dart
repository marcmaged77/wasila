import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wasila/App/App.dart';
import 'package:wasila/App/Pages/chatbox.dart';
import 'package:wasila/App2/App2.dart';
import 'Login-Discover.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign in/sign_in_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences.setMockInitialValues({});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');

  runApp(email != null ? MyHomeePage2() : MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
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


      debugShowCheckedModeBanner: false, // to remove the debug banner on top of the screen
      theme: ThemeData(fontFamily:'head'),

      home: MySplash(),
      routes: {
        '/MainPage': (context) =>MainPage(),
      },
    );
  }
}


/////////////////////////////////////////////////////////////////////////////Splash screen Widget //////////////////////////////////////////////////////////
class MySplash extends StatefulWidget {



  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(
  //     seconds: 3),
  //       (){
  //         Navigator.push(context, MaterialPageRoute(builder:(context)=> MyHomePage(),
  //         ),
  //         );
  //       },
  // );
  // }

//////////////////////////////////////////////////Splash Screen /////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      backgroundColor: Color(0xff6930c3),
      image: Image.asset('images/logo.png'),
      loaderColor: Colors.white,
      photoSize: 180,
      navigateAfterSeconds: MyHomePage(),
    );
  }
}
///////////////////////////////////////////////////Splash Screen /////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////Splash screen Widget /////////////////////////////////////////////////////////////////////////////////






///////////////////////////////////////////////////////// one time page to be //////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff6930c3) ,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.end,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[




          Container(
              padding: EdgeInsets.only(right:0),
              child:Column(



                //////////////////////////////////////////////////////////top body //////////////////////////////////////////////////
                crossAxisAlignment: CrossAxisAlignment.start ,

                children: <Widget>[
                  Container(  padding: EdgeInsets.only(right:40),

                    child:Text('وسيلة', style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900
                    ),),
                  ),


                  Container(  padding: EdgeInsets.only(right:40),
                    child:Text('استكشف . تعلم . وابدأ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),


                  Container(
                    padding: EdgeInsets.only(right:40),
                    child:Text('مسيرتك المهنية في', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),


                  Container(
                    padding: EdgeInsets.only(right:40),
                    child:Text('الموشن الجرافيك', style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  ),

                  //////////////////////////////////////////////////////////top body //////////////////////////////////////////////////









                  //////////////////////////////////////////////////////////hero and button//////////////////////////////////////////////////

                  Stack(



                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: MediaQuery.of(context).size.height*0.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/intro.png'),
                                fit:BoxFit.cover
                            )
                        ),
                      ),


                      Positioned(
                        bottom: 50,
                        left: 30,
                        right:30,
                        child: Center(
                          child: InkWell(
                            onTap:(){
                              openMainPage();
                            },
                            child: Container(

                              padding: EdgeInsets.symmetric(horizontal:50, vertical: 25 ),
                              decoration: BoxDecoration(
                                  color: Color(0xfff6f5f1) ,
                                  borderRadius:BorderRadius.all(Radius.circular(30))
                              ),
                              child: Text('استكشف الأن', style:TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              )) ,
                            ),
                          ),
                        ),
                      )



                    ],
                  ),
                  //////////////////////////////////////////////////////////hero and button//////////////////////////////////////////////////



                ],
              )
          )


        ],
      ),
    );
  }


  void openMainPage()
  {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return mainPage();
    }));
  }
}
///////////////////////////////////////////////////////// one time page to be //////////////////////////////////////////////////
