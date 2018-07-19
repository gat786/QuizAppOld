import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/login_page.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    //home:new LandingPage()
    home: new LoginPage(),
  ));
}