import 'package:flutter/material.dart';

import 'package:flutter_movie_app/src/models/movie_model.dart';

class DetailsPage extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {

      final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
      
      return Scaffold(
         body: CustomScrollView(
            slivers: <Widget>[
               _getAppBar(movie),
               SliverList(
                  delegate: SliverChildListDelegate(
                     [
                        SizedBox(height: 11.0),
                        _title(movie)
                     ]
                  )
               )
            ],
         ),
      );
   }

   Widget _getAppBar(Movie movie){

      return SliverAppBar(
         automaticallyImplyLeading: false,
         elevation: 19.9,
         backgroundColor: Colors.pink,
         expandedHeight: 300.0,
         floating: false,
         pinned: true,
         flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
               movie.title.toString(),
               style: TextStyle(color: Colors.white, fontSize: 15.9),
            ),
            background: FadeInImage(
               image: NetworkImage( movie.getBackgroundImg() ),
               placeholder: AssetImage('assets/loading.gif'),
               fit: BoxFit.cover,
            ),
         ),
      );

   }

   Widget _title( Movie movie ){

      return Container(
         padding: EdgeInsets.symmetric(horizontal: 17.0),
         child: Row(
            children: [
               ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image(image: NetworkImage(movie.getImg()), height: 170.0)
               )
            ],
         ),
      );

   }
}