import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie.dart';
import 'dart:core' ;

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0; // Initialize moviesCount
   late List<Movie> movies = [];

  Future<void> initialize() async {
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
    });
  }


  HttpHelper helper = HttpHelper();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (BuildContext context, int position) {
          return ListTile(
            subtitle: Text(movies[position].releaseDate),
            title: Text(movies[position].title),
            // Add more widgets to display other information
          );
        },
      ),
    );
  }
}
