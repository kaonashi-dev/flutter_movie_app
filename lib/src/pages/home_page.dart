import 'package:flutter/material.dart';

import 'package:flutter_movie_app/src/providers/movie_provider.dart';
import 'package:flutter_movie_app/src/widgets/card_swiper_widget.dart';

import 'package:flutter_movie_app/src/models/movie_model.dart';

class HomePage extends StatelessWidget {

   final movieProvider = new MovieProvider();
   
   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: Text('Peliculas'),
            actions: <Widget>[
               IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
               )
            ],
         ),
         body: Container(
            child: Column(
               children: <Widget>[
                  _swiperCard(),
               ],
            ),
         ),
      );
   }

   Widget _swiperCard(){

      return FutureBuilder(
         future: movieProvider.getNowPlaying(),
         builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            
            if (snapshot.hasData) {
               return CardSwiper(movies: snapshot.data!);
            } else {
               return Container(
                  height: 500,
                  child: Center(
                     child: CircularProgressIndicator()
                  )
               );
            }
         
         },
      );
   }

}