import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'movie.dart'; // Import the Movie class

class HttpHelper {
  final String urlKey = 'api_key=72e0b0e05949098585fedd3d1a103818';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<List<Movie>> getUpcoming() async {
    final String upcoming = '$urlBase$urlUpcoming$urlKey$urlLanguage';
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

}

