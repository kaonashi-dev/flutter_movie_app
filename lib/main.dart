import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         theme: ThemeData(
            primaryColor: Colors.pink
         ),
         title: 'Material App',
         home: Scaffold(
            appBar: AppBar(
            title: Text('APP'),
         ),
         body: Center(
            child: Container(
            child: Text('Hello World'),
         ),
        ),
      ),
   );
  }
}