import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/providers/movie_provider.dart';
import 'package:flutter_movie_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
   
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

      final movieProvider = new MovieProvider();
      movieProvider.getNowPlaying();

      return CardSwiper();
   }

}