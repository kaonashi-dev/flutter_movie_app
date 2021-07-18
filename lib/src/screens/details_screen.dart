import 'package:flutter/material.dart';

import 'package:flutter_movie_app/src/models/movie_model.dart';

class DetailsScreen extends StatelessWidget {

   
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
                        _title(movie, context),
                        SizedBox(height: 9),
                        _Overview(movie),
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
         expandedHeight: 500.0,
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

   Widget _title( Movie movie , BuildContext context){

      final TextTheme textTheme = Theme.of(context).textTheme;
      final size = MediaQuery.of(context).size;

      return Container(
         constraints: BoxConstraints(maxWidth: size.width - 100),
         padding: EdgeInsets.symmetric(horizontal: 19),
         child: Row(
            children: [
               ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image(image: NetworkImage(movie.getImg()), height: 170.0)
               ),
               SizedBox(width: 19),
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     
                     Text(movie.title.toString(), style: textTheme.headline5, overflow: TextOverflow.clip, maxLines: 1, softWrap: false,),
                     Text(movie.originalTitle.toString(), style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                     Row(
                        children: [
                           Icon(Icons.star_outline, size: 17, color: Colors.yellow),
                           SizedBox( width: 5 ),
                           Text(movie.voteAverage.toString(), style: textTheme.caption)
                        ],
                     ),
                  ],
               ),
            ],
         ),
      );

   }
}

class _Overview extends StatelessWidget {

   final Movie _movie;
   _Overview(this._movie);
   
   @override
   Widget build(BuildContext context) {
      return Container(
         padding: EdgeInsets.symmetric(horizontal: 19),
         child: Text(
            _movie.overview.toString(),
            textAlign: TextAlign.justify,
         ),
      );
   }
}