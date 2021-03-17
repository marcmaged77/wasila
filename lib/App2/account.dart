import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasila/main.dart';
import 'package:wasila/sign in/sign_in_google.dart';
User loggedInUser;


class account extends StatefulWidget {
  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Text('حسابي'),
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
body: Container(
  child:  Container(
    padding: EdgeInsets.only(right: 20,left:20,top: 20),

    child: Column(
      children: <Widget>[
        Container(
          child: ClipRRect(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight:  Radius.circular(15),
            ),
            child: ListTile(
              leading: Text('البريد',style:TextStyle(
                fontSize: 14,
              ),),
              title: Text(loggedInUser.email,style:TextStyle(
                fontSize: 14,
              ),),

              tileColor:                Color(0xffd3e0ea),
              trailing: Icon(Icons.email),

            ),
          ),
        ),

SizedBox(height: 20,),
        Container(

          child: ClipRRect(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight:  Radius.circular(15),
            ),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('تسجيل الخروج',style:TextStyle(
                fontSize: 14,
              ),),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                _auth.signOut();
                signOutGoogle();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                      (Route<dynamic> route) => false,
                );
              },
              tileColor:                Color(0xffd3e0ea),
              trailing: Icon(Icons.arrow_forward_ios),

            ),
          ),
        ),


      ],

    ),
  ),
),
    );
  }
}
