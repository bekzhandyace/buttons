import 'package:flutter/material.dart';

import 'movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rendezvous'),
        ),
        body: ColoredBox(
          color: Color.fromRGBO(24, 23, 27, 1.0),
          child: ListView(
            children: const [
              MovieDetailsMainInfoWidget(),
            ],
          ),
        ));
  }
}
