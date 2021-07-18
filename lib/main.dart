import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/screens/screens.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'PELÌCULAS',
         initialRoute: '/',
         routes: {
            '/':        (BuildContext context) => HomeScreen(),
            'details':  (BuildContext context) => DetailsScreen(),
         },
         theme: ThemeData.light().copyWith(
            primaryColor: Colors.pink,
            appBarTheme: AppBarTheme(
               color: Colors.pinkAccent,
               elevation: 0,
               centerTitle: true,
            )
         ),
   );
  }
}