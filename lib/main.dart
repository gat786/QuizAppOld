import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/help_us.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home:new LandingPage()
  ));
}