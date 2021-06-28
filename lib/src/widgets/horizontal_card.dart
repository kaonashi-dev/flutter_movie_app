import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/models/movie_model.dart';

class HorizontalCard extends StatelessWidget {

   final List<Movie> movies;

   HorizontalCard({ required this.movies});

   @override
   Widget build(BuildContext context) {

      final _screnSize = MediaQuery.of(context).size;
      
      return Container(
         height: _screnSize.height * 0.2,
         child: PageView(
            pageSnapping: false,
            controller: PageController(
               initialPage: 1,
               viewportFraction: 0.3
            ),
            children: _cards(),
         ),
      );
   
   }

   List<Widget> _cards(){

      return movies.map((movie) {

         return Container(
            margin: EdgeInsets.only(right: 13.0),   
            child: Column(
               children: [
                  ClipRRect(
                     borderRadius: BorderRadius.circular(11.0),
                     child: FadeInImage(
                       placeholder: AssetImage('assets/no-image.jpg'), 
                       image: NetworkImage(movie.getImg()),
                       height: 111.1,
                       fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                     movie.title.toString(),
                     overflow: TextOverflow.ellipsis,
                  )
               ],
            ),
         
         );

      }).toList();

   }

}