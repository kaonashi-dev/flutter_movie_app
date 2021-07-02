import 'package:flutter/material.dart';

import 'package:flutter_movie_app/src/models/movie_model.dart';

class DetailsPage extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
      
      final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
      
      return Scaffold(
         body: Center(
            child: Text(movie.title.toString()),
         ),
      );
   }
}