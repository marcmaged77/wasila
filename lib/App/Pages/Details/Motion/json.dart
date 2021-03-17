import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';



import 'package:wasila/App/Pages/Details/Motion/3dArtt.dart';
import 'package:wasila/App/Pages/Details/Motion/graphic.dart';
import 'package:wasila/App/Pages/Details/Motion/listCourse.dart';

class json extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JsonT();
  }
}

class JsonT extends StatefulWidget {
  @override
  _JsonTState createState() => _JsonTState();
}

class _JsonTState extends State<JsonT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Text(' json'),
        elevation: 0,
      ),
      body:
      // GridView.builder(
      //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //         maxCrossAxisExtent: 200,
      //         childAspectRatio: 3 / 2,
      //         crossAxisSpacing: 20,
      //         mainAxisSpacing: 20),
      //     itemCount:data == null ? 0 : data.length,
      //     itemBuilder: (BuildContext ctx, index) {
      //       var name = data[index]['name'];
      //       //            var email = data[index]['description'];
      //       //            var cover = data[index]['cover'];
      //       return Container(
      //         alignment: Alignment.center,
      //         child: Text(name),
      //         decoration: BoxDecoration(
      //             color: Colors.amber,
      //             borderRadius: BorderRadius.circular(15)),
      //       );
      //     }),




      new GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5.0,
    mainAxisSpacing: 20.0,),
          itemCount: data == null ? 0 : data.length,

          itemBuilder: (BuildContext ctx, index) {
                 var name = data[index]['name'];
                 var email = data[index]['description'];
                 var cover = data[index]['cover'];


            return GestureDetector(

              onTap: (){

                if(cover == 'images/3d1.jpg'){
                  // open3dArt();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Art3Course(name: name),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: data[index],
                      ),
                    ),
                  );


                  //
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder:(context){
                  //   return Art3Course(name);
                  // }
                  //       settings: RouteSettings(
                  //       arguments: todos[index],
                  //     ),
                  //
                  // ));
                }if(cover == 'images/motion.jpg'){
                  openMotion();
                }if(cover =='images/graphic.jpg' ){
                  openGraphic();
                }



              },
              child: Stack(
                  children:<Widget> [
                    Container(
                    width: 150,
                    height: 200,
                    decoration:  BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 25.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              10.0, // Move to right 10  horizontally
                              15.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color:Color(0xff8ac4d0),
                        image: DecorationImage(image:AssetImage(cover),
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


      //
      // ListView.builder(
      //     itemCount: data == null ? 0 : data.length,
      //     itemBuilder: (BuildContext context, int index) {
      //
      //       var name = data[index]['name'];
      //       var email = data[index]['description'];
      //       var cover = data [index]['cover'];
      //
      //       return new Column(
      //         children: <Widget>[
      //           new ListTile(
      //             leading: CircleAvatar(
      //               child: Image.asset(cover),
      //             ),
      //             title: Text(name),
      //             subtitle: Text(email),
      //           ),
      //           new Divider(),
      //         ],
      //       );
      //     }),
    );
  }

  List data;
  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }


  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('images/db (2).json');
    setState(() => data = jsonDecode(jsonText));
    return 'success';
  }





  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //call get json data
  //   this.getJSONData();
  // }
  getJSONData(){
    print("get json data enabled");
  }
  // void open3dArt()
  // {
  //   Navigator.push(context, MaterialPageRoute(builder:(context){
  //     return Art3Course();
  //   }));
  // }
  void openMotion()
  {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return MotionCourse();
    }));
  }
  void openGraphic()
  {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return Graphic();
    }));
  }
}
