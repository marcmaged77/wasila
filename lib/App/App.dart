import 'package:flutter/material.dart';
import 'package:wasila/App/Pages/CartPage.dart';
import 'package:wasila/App/Pages/ChatWelcome.dart';
import 'package:wasila/App/Pages/HomeScreen.dart';
import 'package:wasila/App/Pages/ProfileScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MyHomeePage extends StatelessWidget {





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


      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily:'head'),
      home: Home(),




    );
  }
}



class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Image.asset("images/logo.png", height: 150,),
        elevation: 0,
        // actions:<Widget>[
        //   IconButton(
        //     icon: Icon(Icons.add_shopping_cart),
        //     onPressed: (){
        //       openCart();
        //     },
        //   )
        // ],
      ),
backgroundColor: Color(0xffe8eae6),

      
      body: Column(children: <Widget> [
        
        (_index == 0 ? Home1(context) : (_index == 1 ? course(context) : Profile1(context))               ),


        Spacer(),

Container(
    padding: EdgeInsets.only(right: 20,left:20),


    child: Divider(height: 15,
    thickness: 2,
    )),

        Padding(
          padding: EdgeInsets.only(top: 10,right:18,left: 18, bottom: MediaQuery.of(context).padding.bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[







            GestureDetector(
              onTap: (){
                setState((){
                  _index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(color: _index == 0 ?  Color(0xff6930c3): Colors.transparent, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                  child: Row(children: <Widget>[
                    Icon(Icons.home, color:_index == 0 ? Colors.white : Colors.black ,),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text( "الرئيسية",style: TextStyle(
                        color: _index == 0 ? Colors.white : Colors.black ,
                        fontSize: 13
                      )),
                    )

                  ],),
                ),
              ),
            ),


            GestureDetector(
              onTap: (){
                setState((){
                  _index = 1;
                });
              },
              child: Container(
                decoration: BoxDecoration(color: _index == 1 ? Color(0xff6930c3): Colors.transparent, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                  child: Row(children: <Widget>[
                    Icon(Icons.book, color:_index == 1 ? Colors.white : Colors.black ,),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text( "المناقشات" ,style: TextStyle(color: _index == 1 ? Colors.white : Colors.black,
                          fontSize: 13)),
                    )

                  ],),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){

                setState((){
                  _index = 2;
                });
              },
              child: Container(
                decoration: BoxDecoration(color: _index == 2 ? Color(0xff6930c3): Colors.transparent, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                  child: Row(children: <Widget>[
                    Icon(Icons.account_box, color:_index == 2 ? Colors.white : Colors.black ,),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text("حسابي" ,style: TextStyle(color: _index == 2 ? Colors.white : Colors.black ,
                          fontSize: 13)),
                    )

                  ],),
                ),
              ),
            )




          ],),
        )





      ],),




    );
  }

  @override
  Widget Home1(BuildContext context){
    return  HomePageScreen();
  }

  @override
  Widget course(BuildContext context){
    return WelcomScreen();

  }
  @override
  Widget Profile1(BuildContext context){
    return Body();
  }
  void openCart(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return CartPage();
    }));
  }

}





