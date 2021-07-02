import 'package:flutter/material.dart';

import 'package:flutter_movie_app/src/providers/movie_provider.dart';
import 'package:flutter_movie_app/src/widgets/card_swiper_widget.dart';

import 'package:flutter_movie_app/src/models/movie_model.dart';
import 'package:flutter_movie_app/src/widgets/horizontal_card.dart';

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
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                  _swiperCard(),
                  _footer(context),
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

   Widget _footer(BuildContext context){

      movieProvider.getPopular();
      final _screnSize = MediaQuery.of(context).size;

      return Container(
         width: double.infinity,
         child: Column(
            children: <Widget>[
               
               Text('Populares', style: Theme.of(context).textTheme.headline6),

               StreamBuilder(
                  stream: movieProvider.popularStream,
                  builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot){

                     if (snapshot.hasData) {
                        return HorizontalCard(movies: snapshot.data!, nextPage: movieProvider.getPopular);
                     } else {
                        return Container(
                           height: _screnSize.height * 0.1,
                           child: Center(
                              child: CircularProgressIndicator()
                           )
                        );
                     }

                  },
               ),

            ],
         ),
      );
   
   }

}