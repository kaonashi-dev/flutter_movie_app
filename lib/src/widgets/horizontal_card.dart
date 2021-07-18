import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/models/movie_model.dart';

class HorizontalCard extends StatelessWidget {

   final List<Movie> movies;
   final Function nextPage;

   HorizontalCard({ required this.movies, required this.nextPage});

   final _pageController = new PageController(
      initialPage: 1,
      viewportFraction: 0.3,
   );

   @override
   Widget build(BuildContext context) {

      final _screnSize = MediaQuery.of(context).size;

      _pageController.addListener(() {
         
         if( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 300 ){
            nextPage();
         }

      });
      
      return Container(
         height: _screnSize.height * 0.17,
         child: PageView.builder(
            pageSnapping: false,
            controller: _pageController,
            // children: _cards(),
            itemCount: movies.length,
            itemBuilder: (context, i){
              return _card(context, movies[i]); 
            },
         ),
      );
   
   }

   Widget _card(BuildContext context, Movie movie){
      final card = Container(
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
                     textAlign: TextAlign.center,
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                  )
               ],
            ),
         );
      
      return GestureDetector(
         child: card,
         onTap: () {
            Navigator.pushNamed(context, 'details', arguments: movie);
         },
      );
   }

}