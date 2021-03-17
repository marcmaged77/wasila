import 'package:flutter/material.dart';
import 'package:wasila/App/Pages/Details/Motion/3dArtt.dart';
import 'package:wasila/App/Pages/Details/Motion/concept.dart';
import 'package:wasila/App/Pages/Details/Motion/graphic.dart';
import 'package:wasila/App/Pages/Details/Motion/json.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';


import 'package:wasila/App/Pages/Details/Motion/listCourse.dart';
import 'package:wasila/App/Pages/chatbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasila/App/Pages/freeCourses.dart';



User loggedInUser;


class HomePageScreen2 extends StatefulWidget {




  @override
  _HomePageScreen2State createState() => _HomePageScreen2State();
}

class _HomePageScreen2State extends State<HomePageScreen2> {
  TextEditingController _searchController = TextEditingController();
  final _auth = FirebaseAuth.instance;



  // @override
  // void initState() {
  //   super.initState();
  //
  //   getCurrentUser();
  // }

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
    return Container(
      padding: EdgeInsets.only(left: 17, right: 17, top: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "مرحبا بك ،",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 5,
              ),
              Text(

                'في وسيلة',
                style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.w500,
                    // color: Colors.black.withOpacity(0.7)),
              )),
              SizedBox(
                width: 180,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: new NetworkImage('https://uctlanguagecentre.com/wp-content/uploads/2020/05/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(new Radius.circular(65.0)),
                  border: new Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ],
          ),




          SizedBox(
            height: 10,
          ),



          Container(
              padding: EdgeInsets.only(right: 130, left: 130),
              child: Divider(
                height: 15,
                thickness: 2,
              )),

          SizedBox(
            height: 20,
          ),




          // Container(
          //   height: 45,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: Color(0xfff5f5f7)),
          //   child: Center(
          //     child: TextField(
          //       controller: _searchController,
          //       cursorColor: Colors.black,
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: "البحث",
          //         hintStyle: TextStyle(fontSize: 13),
          //         contentPadding: EdgeInsets.only(right: 20, bottom: 7),
          //         prefixIcon: Icon(
          //           Icons.search,
          //           color: Colors.blue.withOpacity(0.5),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 10,
          ),

          // Row(
          //   children: <Widget>[
          //     Container(
          //       padding: EdgeInsets.only(right: 170),
          //     child:
          //     Text('دورات'),
          //     )
          //     // Text('عرض الكل',
          //     //     style: TextStyle(
          //     //         fontWeight: FontWeight.bold, color: Colors.blue))
          //   ],
          // ),

          // SizedBox(height: 80,),
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text('اختار ماذا تريد ان تتعلمه',style:TextStyle(
                  fontSize: 20
              ))),
          SizedBox(height: 20,),
          Container(
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 40.0, // soften the shadow
                  spreadRadius: 1.0,//extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    - 10.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(30),

            ),


            child: SizedBox(
              height: 400,
              width: 400,
              child: new GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: data == null ? 0 : data.length,

                  itemBuilder: (BuildContext ctx, index) {
                    var name = data[index]['name'];
                    var email = data[index]['description'];
                    var coverr = data[index]['coverr'];

                    var cover = data[index]['cover'];
                    var id = data[index]['id'];


                    return GestureDetector(
onLongPress: (){
  
},
                      onTap: (){

                        if(coverr == 'images/3d1.jpg'){
                          print(name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Art3Course(name:name,coverr: coverr, cover: cover,id: id, ),


                            ),
                          );


                        }if(coverr == 'images/motion.jpg'){
                          print(name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MotionCourse(name:name,coverr: coverr, cover: cover,id: id, ),
                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.

                            ),
                          );



                        }if(coverr =='images/graphic.jpg' ){

                          print(name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Graphic(name:name,coverr: coverr, cover: cover,id: id, ),
                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.

                            ),
                          );



                        }if(coverr =='images/concept.jpg'){
                          print(name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Concept(name:name,coverr: coverr, cover: cover,id: id, ),
                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.

                            ),
                          );
                        }



                      },
                      child: Stack(
                          children:<Widget> [
                            Container(
                              width: 200,
                              height: 200,
                              decoration:  BoxDecoration(
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.8),
                                //     blurRadius: 25.0, // soften the shadow
                                //     spreadRadius: 5.0, //extend the shadow
                                //     offset: Offset(
                                //       10.0, // Move to right 10  horizontally
                                //       15.0, // Move to bottom 10 Vertically
                                //     ),
                                //   )
                                // ],
                                  borderRadius: BorderRadius.circular(30),
                                  color:Color(0xff8ac4d0),
                                  image: DecorationImage(image:AssetImage(coverr),
                                      fit: BoxFit.fitHeight)
                              ),
                            ),

                            Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(right: 10, top: 10)
                                    ,child: Text(name, style: TextStyle(color: Colors.white,fontSize: 15),))
                              ],
                            )
                          ]
                      ),
                    );

                  }),
            ),
          ),
          SizedBox(height: 10,),

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
                leading: Icon(Icons.book),
                title: Text('الدورات المجانية',style:TextStyle(
                  fontSize: 14,
                ),),
                onTap: () {
                  openFreeCourse();
                },
                tileColor:                Color(0xffd3e0ea),
                trailing: Icon(Icons.arrow_forward_ios),

              ),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(left:30),
          //   child: Row(
          //       children:<Widget>[
          //
          //         Spacer(),
          //
          //
          //         GestureDetector(
          //           onTap: (){
          //             open3dArt();
          //
          //           },
          //           child: Stack(
          //               children:<Widget> [Container(
          //                 padding: EdgeInsets.only(left: 200),
          //                 width: 150,
          //                 height: 200,
          //                 decoration:  BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(0.8),
          //                         blurRadius: 25.0, // soften the shadow
          //                         spreadRadius: 5.0, //extend the shadow
          //                         offset: Offset(
          //                           15.0, // Move to right 10  horizontally
          //                           15.0, // Move to bottom 10 Vertically
          //                         ),
          //                       )
          //                     ],
          //                     borderRadius: BorderRadius.circular(20),
          //                     color:Color(0xff8ac4d0),
          //                     image: DecorationImage(image:AssetImage('images/3d1.jpg'),
          //                         fit: BoxFit.fitHeight)
          //                 ),
          //               ),
          //
          //                 Column(
          //                   children: <Widget>[
          //                     Container(
          //                         padding: EdgeInsets.only(right: 10, top: 10)
          //                         ,child: Text('ثري دي ارت', style: TextStyle(color: Colors.white,fontSize: 15),))
          //                   ],
          //                 )
          //               ]
          //           ),
          //         ) ,
          //
          //
          //         Spacer(),
          //
          //
          //
          //         GestureDetector(
          //           onTap: (){
          //             openjson();
          //           },
          //           child: Stack(
          //               children:<Widget>[ Container(
          //                 padding: EdgeInsets.only(left: 200),
          //                 width: 150,
          //                 height: 200,
          //                 decoration:  BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(0.8),
          //                         blurRadius: 25.0, // soften the shadow
          //                         spreadRadius: 5.0, //extend the shadow
          //                         offset: Offset(
          //                           15.0, // Move to right 10  horizontally
          //                           15.0, // Move to bottom 10 Vertically
          //                         ),
          //                       )
          //                     ],
          //                     borderRadius: BorderRadius.circular(20),
          //                     color:Color(0xff8ac4d0),
          //                     image: DecorationImage(image:AssetImage('images/concept.jpg'),
          //                         fit: BoxFit.cover)
          //
          //                 ),
          //               ),
          //                 Column(
          //                   children: <Widget>[
          //                     Container(
          //                         padding: EdgeInsets.only(right: 10, top: 10)
          //                         ,child: Text('كونسبت ارت', style: TextStyle(color: Colors.white,fontSize: 15),))
          //                   ],
          //                 )
          //               ]),
          //         ) ,
          //       ]
          //   ),
          // ),
          //
          //
          // SizedBox(height:15,),
          //
          //
          // Container(
          //   padding: EdgeInsets.only(left:30),
          //   child: Row(
          //       children:<Widget>[
          //         Spacer(),
          //
          //
          //         GestureDetector(
          //           onTap: (){
          //              openMotion();
          //           },
          //           child: Stack(
          //               children:<Widget> [Container(
          //                 padding: EdgeInsets.only(left: 200),
          //                 width: 150,
          //                 height: 200,
          //                 decoration:  BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(0.8),
          //                         blurRadius: 25.0, // soften the shadow
          //                         spreadRadius: 5.0, //extend the shadow
          //                         offset: Offset(
          //                           15.0, // Move to right 10  horizontally
          //                           15.0, // Move to bottom 10 Vertically
          //                         ),
          //                       )
          //                     ],
          //                     borderRadius: BorderRadius.circular(20),
          //                     color:Color(0xff8ac4d0),
          //                     image: DecorationImage(image:AssetImage('images/motion.jpg'),
          //                         fit: BoxFit.cover)
          //
          //                 ),
          //               ),
          //                 Column(
          //                   children: <Widget>[
          //                     Container(
          //                         padding: EdgeInsets.only(right: 10, top: 10)
          //                         ,child: Text('موشن جرافيك', style: TextStyle(color: Colors.white,fontSize: 15),)),
          //
          //                   ],
          //                 )
          //               ]),
          //         ) ,
          //
          //
          //
          //         Spacer(),
          //
          //         Stack(
          //             children :<Widget>[
          //
          //               Container(
          //                 padding: EdgeInsets.only(left: 200),
          //                 width: 150,
          //                 height: 200,
          //                 decoration:  BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(0.8),
          //                         blurRadius: 25.0, // soften the shadow
          //                         spreadRadius: 5.0, //extend the shadow
          //                         offset: Offset(
          //                           15.0, // Move to right 10  horizontally
          //                           15.0, // Move to bottom 10 Vertically
          //                         ),
          //                       )
          //                     ],
          //                     borderRadius: BorderRadius.circular(20),
          //                     color:Color(0xff8ac4d0),
          //                     image: DecorationImage(image:AssetImage('images/graphic.jpg'),
          //                         fit: BoxFit.fill)
          //
          //                 ),
          //               ),
          //
          //               Column(
          //                 children: <Widget>[
          //                   Container(
          //                       padding: EdgeInsets.only(right: 10, top: 10)
          //                       ,child: Text('جرافيك ديزاين', style: TextStyle(color: Colors.white,fontSize: 15),))
          //                 ],
          //               )
          //             ],) ,
          //       ]
          //   ),
          // ),


        ],
      ),
    );
  }
  List data;
  List imagesUrl= [];
  @override
  void initState() {
    super.initState();
    this.loadJsonData();
    getCurrentUser();
  }

  Future<String> loadJsonData() async {



    // var jsonData = await http.get(
    //     "https://wasila-db.herokuapp.com/courses");
    //
    //
    // var fetchData = jsonDecode(jsonData.body);
    // setState(() {
    //   data = fetchData;
    //   data.forEach((element) {
    //     imagesUrl.add(element['cover']);
    //   });
    // });




    // const path = 'https://wasila-db.herokuapp.com/courses';
    var jsonText =await rootBundle.loadString('images/db (2).json');

    // await http.get(path);
    //
    // // http.get('https://wasila-db.herokuapp.com/courses');
    //
    // rootBundle.loadString('https://wasila-db.herokuapp.com/courses');
    setState(() => data = jsonDecode(jsonText));
    return 'success';
  }

  void openMotion()
  {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return MotionCourse();
    }));
  }

  // void open3dArt()
  // {
  //   Navigator.push(context, MaterialPageRoute(builder:(context){
  //     return Art3Course(name,cover);
  //   }));
  // }
  void openChatBox(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return ChatScreen();
    }));
  }

  void openFreeCourse(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return FreeCourse();
    }));
  }

  void openjson(){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return json();
    }));
  }
  void openGraphic()
  {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return Graphic();
    }));
  }
  void openConcept()
  {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return Concept();
    }));
  }
}
