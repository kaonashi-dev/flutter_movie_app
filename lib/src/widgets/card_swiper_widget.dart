import 'package:flutter/material.dart';

import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiper extends StatelessWidget {
   
   final List<dynamic> ?movies;

   CardSwiper({ @required this.movies});
   
   @override
   Widget build(BuildContext context) {

      final _screnSize = MediaQuery.of(context).size;

      return Container(
         padding: EdgeInsets.only(top: 11.0),
         child: Swiper(
            itemBuilder: (BuildContext context,int index){
               return ClipRRect(
                  borderRadius: BorderRadius.circular(19.0),
                  child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover),
               );
            },
            layout: SwiperLayout.STACK,
            itemWidth: _screnSize.width * 0.7,
            itemHeight: _screnSize.width * 0.7,
            itemCount: 3,
            pagination: new SwiperPagination(),
            // control: new SwiperControl(),
         ),
      );
  }
}