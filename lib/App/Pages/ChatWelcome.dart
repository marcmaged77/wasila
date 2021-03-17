import 'package:wasila/App/Pages/chatbox.dart';
import 'package:wasila/constants.dart';
import 'package:flutter/material.dart';



class WelcomScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: SafeArea(
          child: Column(
            children: <Widget>[
              Image.asset('images/welcome_image.png'),
              SizedBox(height: 10,),
              Text('مرحبا بك في ملتقي الطلاب',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),),
              Text('هنا يمكنك التحدث مع اصدقائق و الاسفسار عن كل المشاكل التي تواجهك',
              textAlign: TextAlign.center,),
              SizedBox(height: 50,),

              TextButton(
                  onPressed: (){
                    openChatBox();
                  },

                  child: Container(
                    padding: EdgeInsets.only(right: 180),
                    child: Row(
                        children: <Widget>[
                          Text('ابدأ',style: TextStyle(color: Colors.blue.withOpacity(0.8)),),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward_ios,
                            size:16,
                            color: Colors.black,)

                        ]
                    )
                  )
                 )

            ],
          )),
    );
  }
  void openChatBox(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return ChatScreen();
    }));
  }
}
