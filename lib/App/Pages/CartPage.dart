import 'package:flutter/material.dart';
import 'package:wasila/App/Pages/cart.dart';



class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("السلة"),
        backgroundColor: Color(0xff6930c3),


      ),
      backgroundColor: Color(0xffe8eae6),
      body: Cart(),

    );
  }
}
