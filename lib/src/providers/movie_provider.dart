import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_movie_app/src/models/movie_model.dart';

class MovieProvider{

   String _apikey    = '6d549545b22d365b72fd79d0ac428a4f';
   String _url       = 'api.themoviedb.org';
   String _language  = 'es-ES';

   Future<List<Movie>> _respose(Uri url) async{
      
      final response = await http.get(url);
      final decodedData = json.decode(response.body);
      final movies = new Movies.formJsonList(decodedData['results']);

      return movies.items;
   
   }

   Future<List<Movie>> getNowPlaying() async{

      final url = Uri.https(_url, '/3/movie/now_playing', {
         'api_key': _apikey,
         'language': _language,
      });

      return await _respose(url);

   }

   Future<List<Movie>> getPopular() async{

      final url = Uri.https(_url, '/3/movie/popular', {
         'api_key': _apikey,
         'language': _language,
      });

      return await _respose(url);
   }

}