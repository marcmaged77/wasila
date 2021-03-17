import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasila/App2/Pages/HomeScreen2.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:dio/dio.dart';







User loggedInUser;








class MotionCourse extends StatefulWidget {


  final String name;
  final String coverr;
  final String cover;
  final int id;

  const MotionCourse({ Key key, this.name , this.coverr, this.cover, this.id}): super(key: key);

  // { Key key, this.name , this.coverr, this.cover, this.id}
// (int id, String name, String cover, User email)


  // Future<http.Response>  createCourse(
  //     ) {
  //   return http.post(
  //     Uri.https('https://wasila-db.herokuapp.com/', 'courses'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'courseId': id,
  //       'name': name,
  //       'userEmail': loggedInUser,
  //       "image": cover
  //
  //
  //
  //     }),
  //   );
  // }





  @override
  _MotionCourseState createState() => _MotionCourseState();
}

class _MotionCourseState extends State<MotionCourse> {
  Dio dio = new Dio();
  final _auth = FirebaseAuth.instance;



  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }
  Future<http.Response> createCourse () async {
    var url ='https://wasila-db.herokuapp.com/carts';

    try{
      http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<dynamic, dynamic>{
          'courseId': widget.id,
          'name': widget.name,
          'userEmail': loggedInUser.email,
          "image": widget.cover


        },),
      );
    }catch(e){
      print(e);

    }

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

  List<Item> _data = generateItems(1);
  List<Item2> _data2 = generateItems2(1);
  List<Item3> _data3 = generateItems3(1);
  List<Item4> _data4 = generateItems4(1);




  Widget buildListPanel() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('مقدمة'),
                );
              },
              body: Container(
                child:
                Column(
                  children: <Widget>[
                    AspectRatio(aspectRatio: 16/9,
                      child: BetterPlayer.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        betterPlayerConfiguration: BetterPlayerConfiguration(
                          aspectRatio: 16 / 9,
                        ),
                      ),)
                  ],
                ),
              ),
              isExpanded: item.isExpanded);
        }).toList());
  }
  Widget buildListPanel2() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data2[index].isExpanded = !isExpanded;
          });
        },


        children: _data2.map<ExpansionPanel>((Item2 item) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('المحاضرة الاولي'),
                );
              },
              body: Container(
                child:
                Column(
                  children: <Widget>[
                    AspectRatio(aspectRatio: 16/9,
                      child: BetterPlayer.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        betterPlayerConfiguration: BetterPlayerConfiguration(
                          aspectRatio: 16 / 9,
                        ),
                      ),)
                  ],
                ),
              ),
              isExpanded: item.isExpanded);
        }).toList());
  }
  Widget buildListPanel3() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data3[index].isExpanded = !isExpanded;
          });
        },


        children: _data3.map<ExpansionPanel>((Item3 item) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('المحاضرة الثانية'),
                );
              },
              body: Container(
                child:
                // Text('he')
                Column(
                  children: <Widget>[
                    AspectRatio(aspectRatio: 16/9,
                      child: BetterPlayer.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        betterPlayerConfiguration: BetterPlayerConfiguration(
                          aspectRatio: 16 / 9,
                        ),
                      ),)
                  ],
                ),
              ),
              isExpanded: item.isExpanded);
        }).toList());
  }
  Widget buildListPanel4() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data4[index].isExpanded = !isExpanded;
          });
        },


        children: _data4.map<ExpansionPanel>((Item4 item) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('المحاضرة الثالثة'),
                );
              },
              body: Container(
                child:
                Column(
                  children: <Widget>[
                    AspectRatio(aspectRatio: 16/9,
                      child: BetterPlayer.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        betterPlayerConfiguration: BetterPlayerConfiguration(
                          aspectRatio: 16 / 9,
                        ),
                      ),)
                  ],
                ),
              ),
              isExpanded: item.isExpanded);
        }).toList());
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Text('الموشن جرافيك '),
        elevation: 0,
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child:
    Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 250),
                      child: Text(
                        "دورة الموشن جرافيك",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 18),
                      ),),
                  Container(
                      padding: EdgeInsets.only(left: 330),
                      child: Text(
                        "محمد علي",
                        style: TextStyle(
                            color: Colors.black.withOpacity(
                              0.4,
                            ),
                            fontSize: 17),
                      ),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff6930c3) ,
                      ),
                      child: Hero(
                        tag: 'course-motion.jpg',
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              image: DecorationImage(
                                  image: AssetImage('images/conceptIntro.png'),
                                  fit: BoxFit.fitHeight)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(child: buildListPanel()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(child: buildListPanel2()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(child: buildListPanel3()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(child: buildListPanel4()),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: (){

openUrl();




createCourse();



print(widget.name);
print(widget.cover);
print(widget.id);
print(loggedInUser.email);
                      },

                      child: Container(
                          padding: EdgeInsets.only(right: 160),
                          child: Row(
                              children: <Widget>[
                                Text('اشترك الأن',style: TextStyle(color: Colors.blue.withOpacity(0.8)),),
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_forward_ios,
                                  size:16,
                                  color: Colors.black,)

                              ],
                          ),
                      ),
                  ),




                ],
              ),
              // Column(
              //   children: <Widget>[
              //     Container(
              //         padding: EdgeInsets.only(left: 250),
              //         child: Text(
              //           "دورة الثري دي آرت",
              //           style: TextStyle(
              //               color: Colors.black.withOpacity(0.6), fontSize: 18),
              //         )),
              //     Container(
              //         padding: EdgeInsets.only(left: 330),
              //         child: Text(
              //           "محمد علي",
              //           style: TextStyle(
              //               color: Colors.black.withOpacity(
              //                 0.4,
              //               ),
              //               fontSize: 17),
              //         )),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Container(
              //       padding: EdgeInsets.only(left: 30, right: 30),
              //       child: Container(
              //
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.all(Radius.circular(50)),
              //           color: Color(0xff6930c3) ,
              //         ),
              //         child: Hero(
              //           tag: 'course-motion.png',
              //           child: Container(
              //             height: 200,
              //             width: MediaQuery.of(context).size.width,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(40)),
              //                 image: DecorationImage(
              //                     image: AssetImage('images/artttt.png'),
              //                     fit: BoxFit.cover)),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 30,
              //     ),
              //     Container(child: buildListPanel()),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Container(child: buildListPanel2()),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Container(child: buildListPanel3()),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Container(child: buildListPanel4()),
              //     SizedBox(
              //       height: 20,
              //     ),
              //
              //     TextButton(
              //         onPressed: (){
              //           openUrl();
              //
              //
              //
              //
              //           createCourse();
              //
              //
              //
              //           print(widget.name);
              //           print(widget.cover);
              //           print(widget.id);
              //           print(loggedInUser.email);
              //
              //         },
              //
              //         child: Container(
              //             padding: EdgeInsets.only(right: 160),
              //             child: Row(
              //                 children: <Widget>[
              //                   Text('اشترك الأن',style: TextStyle(color: Colors.blue.withOpacity(0.8)),),
              //                   SizedBox(width: 10,),
              //                   Icon(Icons.arrow_forward_ios,
              //                     size:16,
              //                     color: Colors.black,)
              //
              //                 ]
              //             )
              //         )
              //     )
              //
              //
              //
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
// Future<http.Response>  createCourse() async{
// var url = 'https://wasila-db.herokuapp.com/carts',
//
//
//    http.post(
//     Uri.https('https://wasila-db.herokuapp.com', '/carts'),
//
//     body: jsonEncode(<String, dynamic>{
//       'courseId': widget.id,
//       'name': widget.name,
//       'userEmail': loggedInUser,
//       "image": widget.cover
//
//
//
//     }),
//   );
// }

}
@override
void openUrl(){
  String urll= 'https://easykash.net/MAS2127';
  launch(urll);

}

// { Key key, this.name , this.coverr, this.cover, this.id}): super(key: key

//
// Future<http.Response> createCourse(int id, String name, String cover, User email) {
//   return http.post(
//     Uri.https('https://wasila-db.herokuapp.com/', 'courses'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, dynamic>{
//       'courseId': id,
//       'name': name,
//       'userEmail': email,
//       "image": cover
//
//
//
//     }),
//   );
// }



class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expandedValue, this.headerValue, this.isExpanded = false});
}

class Item2 {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item2({this.expandedValue, this.headerValue, this.isExpanded = false});
}

class Item3 {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item3({this.expandedValue, this.headerValue, this.isExpanded = false});
}

class Item4{
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item4({this.expandedValue, this.headerValue, this.isExpanded = false});
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
      headerValue: 'Panel $index',
    );
  });
}

List<Item2> generateItems2(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item2(
      headerValue: 'Panel $index',
    );
  });
}

List<Item3> generateItems3(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item3(
      headerValue: 'Panel $index',
    );
  });
}

List<Item4> generateItems4(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item4(
      headerValue: 'Panel $index',
    );
  });



}
































// import 'package:flutter/material.dart';
// import 'package:better_player/better_player.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MotionCourse extends StatefulWidget {
//   @override
//   _MotionCourseState createState() => _MotionCourseState();
// }
//
// class _MotionCourseState extends State<MotionCourse> {
//
//
//
//
//
//   List<Item> _data = generateItems(1);
//   List<Item2> _data2 = generateItems2(1);
//   List<Item3> _data3 = generateItems3(1);
//   List<Item4> _data4 = generateItems4(1);
//
//
//   Widget buildListPanel() {
//     return ExpansionPanelList(
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() {
//             _data[index].isExpanded = !isExpanded;
//           });
//         },
//         children: _data.map<ExpansionPanel>((Item item) {
//           return ExpansionPanel(
//               headerBuilder: (BuildContext context, bool isExpanded) {
//                 return ListTile(
//                   title: Text('مقدمة'),
//                 );
//               },
//               body: Container(
//                 child:
//                 // Text('مقدمة'),
//                 Column(
//                   children: <Widget>[
//                     AspectRatio(aspectRatio: 16/9,
//                     child: BetterPlayer.network(
//                       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//                       betterPlayerConfiguration: BetterPlayerConfiguration(
//                         aspectRatio: 16 / 9,
//                       ),
//                     ),)
//                   ],
//                 ),
//               ),
//               isExpanded: item.isExpanded);
//         }).toList());
//   }
//   Widget buildListPanel2() {
//     return ExpansionPanelList(
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() {
//             _data2[index].isExpanded = !isExpanded;
//           });
//         },
//
//
//         children: _data2.map<ExpansionPanel>((Item2 item) {
//           return ExpansionPanel(
//               headerBuilder: (BuildContext context, bool isExpanded) {
//                 return ListTile(
//                   title: Text('المحاضرة الاولي'),
//                 );
//               },
//               body: Container(
//                 child:
//                 // Text('مقدمة'),
//                 Column(
//                   children: <Widget>[
//                     AspectRatio(aspectRatio: 16/9,
//                       child: BetterPlayer.network(
//                         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//                         betterPlayerConfiguration: BetterPlayerConfiguration(
//                           aspectRatio: 16 / 9,
//                         ),
//                       ),)
//                   ],
//                 ),
//               ),
//               isExpanded: item.isExpanded);
//         }).toList());
//   }
//   Widget buildListPanel3() {
//     return ExpansionPanelList(
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() {
//             _data3[index].isExpanded = !isExpanded;
//           });
//         },
//
//
//         children: _data3.map<ExpansionPanel>((Item3 item) {
//           return ExpansionPanel(
//               headerBuilder: (BuildContext context, bool isExpanded) {
//                 return ListTile(
//                   title: Text('المحاضرة الثانية'),
//                 );
//               },
//               body: Container(
//                 child:
//                 // Text('مقدمة'),
//                 Column(
//                   children: <Widget>[
//                     AspectRatio(aspectRatio: 16/9,
//                       child: BetterPlayer.network(
//                         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//                         betterPlayerConfiguration: BetterPlayerConfiguration(
//                           aspectRatio: 16 / 9,
//                         ),
//                       ),)
//                   ],
//                 ),
//               ),
//               isExpanded: item.isExpanded);
//         }).toList());
//   }
//   Widget buildListPanel4() {
//     return ExpansionPanelList(
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() {
//             _data4[index].isExpanded = !isExpanded;
//           });
//         },
//
//
//         children: _data4.map<ExpansionPanel>((Item4 item) {
//           return ExpansionPanel(
//               headerBuilder: (BuildContext context, bool isExpanded) {
//                 return ListTile(
//                   title: Text('المحاضرة الثالثة'),
//                 );
//               },
//               body: Container(
//                   child:
//                 // Text('مقدمة'),
//                 Column(
//                   children: <Widget>[
//                     AspectRatio(aspectRatio: 16/9,
//                       child: BetterPlayer.network(
//                         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//                         betterPlayerConfiguration: BetterPlayerConfiguration(
//                           aspectRatio: 16 / 9,
//                         ),
//                       ),)
//                   ],
//                 ),
//               ),
//               isExpanded: item.isExpanded);
//         }).toList());
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     appBar: AppBar(
//     backgroundColor: Color(0xff6930c3),
//     title: Text('موشن جرافيك'),
//     elevation: 0,
//     ),
//       body: Container(
//         child: SafeArea(
//           child: Container(
//             padding: EdgeInsets.only(top: 20),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                       padding: EdgeInsets.only(left: 250),
//                       child: Text(
//                         "دورة الموشن جرافيك",
//                         style: TextStyle(
//                             color: Colors.black.withOpacity(0.6), fontSize: 18),
//                       ),),
//                   Container(
//                       padding: EdgeInsets.only(left: 330),
//                       child: Text(
//                         "محمد علي",
//                         style: TextStyle(
//                             color: Colors.black.withOpacity(
//                               0.4,
//                             ),
//                             fontSize: 17),
//                       ),),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 30, right: 30),
//                     child: Container(
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(50)),
//                         color: Color(0xff6930c3) ,
//                       ),
//                       child: Hero(
//                         tag: 'course-motion.jpg',
//                         child: Container(
//                           height: 200,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(40)),
//                               image: DecorationImage(
//                                   image: AssetImage('images/conceptIntro.png'),
//                                   fit: BoxFit.fitHeight)),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(child: buildListPanel()),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(child: buildListPanel2()),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(child: buildListPanel3()),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(child: buildListPanel4()),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextButton(
//                       onPressed: (){
//
// openUrl();
//
//
//
//
// createCourse();
//
//
//
// print(widget.name);
// print(widget.cover);
// print(widget.id);
// print(loggedInUser.email);
//                       },
//
//                       child: Container(
//                           padding: EdgeInsets.only(right: 160),
//                           child: Row(
//                               children: <Widget>[
//                                 Text('اشترك الأن',style: TextStyle(color: Colors.blue.withOpacity(0.8)),),
//                                 SizedBox(width: 10,),
//                                 Icon(Icons.arrow_forward_ios,
//                                   size:16,
//                                   color: Colors.black,)
//
//                               ],
//                           ),
//                       ),
//                   ),
//
//
//
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// @override
// void openUrl(){
//   String urll= 'https://easykash.net/MAS2127';
//   launch(urll);
// }
//
// class Item {
//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
//
//   Item({this.expandedValue, this.headerValue, this.isExpanded = false});
// }
//
// class Item2 {
//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
//
//   Item2({this.expandedValue, this.headerValue, this.isExpanded = false});
// }
//
// class Item3 {
//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
//
//   Item3({this.expandedValue, this.headerValue, this.isExpanded = false});
// }
//
//
// class Item4{
//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
//
//   Item4({this.expandedValue, this.headerValue, this.isExpanded = false});
// }
//
// List<Item> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (index) {
//     return Item(
//       headerValue: 'Panel $index',
//     );
//   });
// }
// List<Item2> generateItems2(int numberOfItems) {
//   return List.generate(numberOfItems, (index) {
//     return Item2(
//       headerValue: 'Panel $index',
//     );
//   });
// }
// List<Item3> generateItems3(int numberOfItems) {
//   return List.generate(numberOfItems, (index) {
//     return Item3(
//       headerValue: 'Panel $index',
//     );
//   });
// }
// List<Item4> generateItems4(int numberOfItems) {
//   return List.generate(numberOfItems, (index) {
//     return Item4(
//       headerValue: 'Panel $index',
//     );
//   });
// }