import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wasila/App/Pages/cart.dart';
import '../../sign in/sign_in_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:better_player/better_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


User loggedInUser;

class FreeCourse extends StatefulWidget {
  @override
  _FreeCourseState createState() => _FreeCourseState();
}

class _FreeCourseState extends State<FreeCourse> {
  final _auth = FirebaseAuth.instance;





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
  void initState() {
    super.initState();
    this.loadJsonData();
    getCurrentUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Image.asset(
          "images/logo.png",
          height: 150,
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xffe8eae6),
      body: Container(
          child: ListView.builder(

                    itemCount:  data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index, ) {
                      var name = data[index]['name'];
                      var cover = data[index]['cover'];
                      var id = data[index]['id'];
                      var image = data[index]['image'];
                      Future<http.Response> createCourse () async {
                        var url ='https://wasila-db.herokuapp.com/carts';

                        try{
                          http.post(url,
                            headers: {"Content-Type": "application/json"},
                            body: jsonEncode(<dynamic, dynamic>{
                              'courseId': id,
                              'name': name,
                              'userEmail': loggedInUser.email,
                              "image": image


                            },),
                          );
                        }catch(e){
                          print(e);

                        }

                      }
                      return new Column(
                        children: <Widget>[
                          new ListTile(

                            title: Text(
                              name,
                              style: TextStyle(fontSize: 15),
                            ),
                            leading: Image.asset(
                              cover,
                              fit: BoxFit.fill,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.add_shopping_cart),
                              color: Color(0xff6930c3),
                              onPressed: () {
                                print("added");
                                createCourse();
                              },
                            ),
                            onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetail(name:name, cover: cover ),


                                ),
                              );
                            }
                          ),
                          new Divider(),
                        ],
                      );
                    })




      ),
    );
  }

  List data;


  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('images/db (1).json');
    setState(() => data = jsonDecode(jsonText));
    print("success");
    return 'success';
  }
}



class CourseDetail extends StatefulWidget {


  final String name;
  final String cover;
  final int id;

  const CourseDetail({ Key key, this.name , this.cover,this.id}): super(key: key);
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override


  List<Item> _data = generateItems(1);
  List<Item2> _data2 = generateItems2(1);




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
                  title: Text('عرض مسبق'),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الدورة"),
        backgroundColor: Color(0xff6930c3),

      ),
      backgroundColor: Color(0xffe8eae6),

      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 20),

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      child: Center(
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8), fontSize: 17),
                        ),

                      )),
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
                        tag: 'course-motion.png',
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              image: DecorationImage(
                                  image: AssetImage(widget.cover),
                                  fit: BoxFit.cover)),
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
                ],
              ),
            )


        ),
      ),
    );;
  }
}

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

