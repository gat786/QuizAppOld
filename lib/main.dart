import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/login_page.dart';
import './pages/ask_name.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    //home:new LoginPage()
    home:new LandingPage()
   
  ));
}