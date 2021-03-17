import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String name;
  final String cover;
  final int id;
  const Cart({Key key, this.name, this.cover, this.id}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                child:
                ListTile(

                    title: Text(
                      "s",
                      style: TextStyle(fontSize: 15),
                    ),

                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      color: Color(0xff6930c3),
                      onPressed: () {
                        print("added");
                      },
                    ),
                    onTap: () {

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CourseDetail(name:name, cover: cover ),
                      //
                      //
                      //   ),
                      // );
                    }
                ),
              ),






            ])],
        ),
      ),
    );
  }
}
