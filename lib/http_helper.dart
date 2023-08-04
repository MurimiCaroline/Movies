import 'package:http/http.dart' as http;
import 'dart:io';


class HttpHelper {
  final String urlKey = 'api_key=72e0b0e05949098585fedd3d1a103818';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<String> getUpcoming() async {
    final String upcoming = '$urlBase$urlUpcoming$urlKey$urlLanguage';
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    } else {
      return ''; // Return an empty string in case of error
    }
  }
}


