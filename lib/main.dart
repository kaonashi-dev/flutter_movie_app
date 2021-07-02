import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/pages/details_page.dart';

import 'package:flutter_movie_app/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
            primaryColor: Colors.pink
         ),
         title: 'Movie app',
         initialRoute: '/',
         routes: {
            '/': (BuildContext context) => HomePage(),
            'details': (BuildContext context) => DetailsPage(),
         },
   );
  }
}