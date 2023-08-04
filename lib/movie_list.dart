import 'package:flutter/material.dart';
import 'http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<String> futureResult;
  HttpHelper helper = HttpHelper();

  @override
  void initState() {
    super.initState();
    futureResult = helper.getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: FutureBuilder<String>(
        future: futureResult,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If an error occurs during data fetching, show an error message
            return Center(
              child: Text('Error loading data'),
            );
          } else {
            // If data is available, display it
            return Container(
              child: Text(snapshot.data ?? 'No data available'),
            );
          }
        },
      ),
    );
  }
}
