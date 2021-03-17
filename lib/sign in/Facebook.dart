

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';



void initiateFacebookLogin() async {
  var facebookLogin = FacebookLogin();
  var facebookLoginResult =
  await facebookLogin.logIn(['email']);


  switch (facebookLoginResult.status) {



    case FacebookLoginStatus.error:
      print("Error");
      break;


    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUser");

      break;


    case FacebookLoginStatus.loggedIn:

      print("LoggedIn");

      break;
  }
}