import 'package:flutter/material.dart';
import 'package:wasila/App2/account.dart';
import '../../sign in/sign_in_google.dart';
import '../../main.dart';
import 'package:url_launcher/url_launcher.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f5f5) ,

      // appBar: AppBar(
      //   title: Text("حسابي الشخصي",style: TextStyle(fontSize: 15,),),
      //   backgroundColor: Color(0xff6930c3) ,
      //
      // ),
body: Body(),

    );
  }
}



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children:[
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,

            ),
            painter: Header(),
          ),
          Column(
          children: [

            // Container(
            //     padding: EdgeInsets.only(top:40,right: 20,left:20),
            //
            //
            //     child: Text("حسابي الشخصي", style: TextStyle(
            //       fontSize: 20,
            //     ),)),

            // Container(
            //   padding: EdgeInsets.only(right: 120,left:40),
            //
            //   child:   ListTile(
            //     leading: Text('مرحبا بك يا',
            //       style: TextStyle(
            //         fontSize: 17,
            //       ),),
            //     trailing: Text(  name,
            //       style: TextStyle(
            //           fontSize: 17,
            //
            //       ),),
            //   ),
            // ),
            SizedBox(height: 35),

            // CircleAvatar(
            //   backgroundImage: NetworkImage(
            //     imageUrl,
            //   ),
            //   radius: 60,
            // ),

            Container(
              width: 130.0,
              height: 130.0,
              decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  image: new NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius:  BorderRadius.all(new Radius.circular(65.0)),
                border: new Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(  "مرحبا بك",
              style: TextStyle(
                fontSize: 17,
                fontFamily:'name',
                color: Colors.white,

              ),),
            SizedBox(height: 3),


           Divider(height: 5,
           color: Colors.white,
           indent: 140,
           endIndent: 140,),

            //
            Text(  name,
              style: TextStyle(
                fontSize: 17,
                  fontFamily:'name',
                color: Colors.white,

              ),),


            // Container(
            //     padding: EdgeInsets.only(right: 40,left:40),
            //
            //     child: Divider(height:20)),

            SizedBox(height: 60),

            // Container(
            //   padding: EdgeInsets.only(right: 20,left:20, top: 30),
            //
            //   child: ClipRRect(
            //
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(15),
            //       bottomLeft: Radius.circular(15),
            //       topRight: Radius.circular(15),
            //       bottomRight:  Radius.circular(15),
            //     ),
            //     child: ListTile(
            //       leading: Icon(Icons.account_circle),
            //       title: Text('حسابي', style: TextStyle(
            //         fontSize: 14,
            //       ),),
            //       onTap: () {},
            //       tileColor:                Color(0xffd3e0ea),
            //       trailing: Icon(Icons.arrow_forward_ios),
            //
            //     ),
            //   ),
            // ),


            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.only(right: 20,left:20),

              child: ClipRRect(

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight:  Radius.circular(15),
                ),
                child: ListTile(
                  leading: Icon(Icons.help_center),
                  title: Text('مركز المساعدة',style:TextStyle(
                    fontSize: 14,
                  ),),
                  onTap: () {
                    openUrl();
                  },
                  tileColor:                Color(0xffd3e0ea),
                  trailing: Icon(Icons.arrow_forward_ios),

                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.only(right: 20,left:20),

              child: ClipRRect(

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight:  Radius.circular(15),
                ),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('حسابي',style:TextStyle(
                    fontSize: 14,
                  ),),
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return account();
                    }));
                  },
                  tileColor:                Color(0xffd3e0ea),
                  trailing: Icon(Icons.arrow_forward_ios),

                ),
              ),
            ),
            SizedBox(height: 20),


            Container(
              padding: EdgeInsets.only(right: 20,left:20),

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
                  onTap: () {
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
        ]
      );

  }
  @override
 void openUrl(){
    String urll= 'https://wasela.netlify.app/contact.html';
    launch(urll);
}
}

class Header extends CustomPainter{
@override
void paint(Canvas canvas,Size size){
  Paint paint= Paint()..color=  Color(0xff6930c3) ;
  Path path=Path()..relativeLineTo(0, 150)
    ..quadraticBezierTo(size.width/2,400,size.width,150)
    ..relativeLineTo(0, -150)
    ..close();
  canvas.drawPath(path, paint);


}
bool shouldRepaint( CustomPainter oldDelegate)=> false;

}
