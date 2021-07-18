import 'package:flutter/material.dart';

import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_movie_app/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
   
   final List<Movie> movies;

   CardSwiper({ required this.movies});
   
   @override
   Widget build(BuildContext context) {

      final _screnSize = MediaQuery.of(context).size;

      return Container(
         height: _screnSize.height * 0.59,
         child: Swiper(
            itemBuilder: (BuildContext context, index){
               return ClipRRect(
                  borderRadius: BorderRadius.circular(19.0),
                  child: FadeInImage(
                     placeholder: AssetImage('assets/no-image.jpg'), 
                     image: NetworkImage(movies[index].getImg()),
                     height: 300.1,
                     fit: BoxFit.cover,
                  ),
               );
            },
            itemCount: this.movies.length,
            layout: SwiperLayout.STACK,
            itemWidth: _screnSize.width * 0.7,
            itemHeight: _screnSize.height * 0.5,
            // pagination: new SwiperPagination(),
            // control: new SwiperControl(),
         ),
      );
  }
}