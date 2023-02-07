import 'package:flutter/material.dart';
import 'package:poolart/screens/about_us/about_us.dart';
import 'package:poolart/screens/contact/contact.dart';
import 'package:poolart/screens/get_a_quote/get_a_quote.dart';
import 'package:poolart/screens/home/home.dart';
import 'package:poolart/screens/projects/projects.dart';

class LandingUtils {
  static const List<Widget> pages = [
    HomeScreen(),
    AboutUsScreen(),
    ProjectsScreen(),
    ContactScreen(),
    GetAQuoteScreen(),
  ];
}
