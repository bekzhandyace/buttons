import 'package:buttons/resource/app_images.dart';
import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.two,
      title: 'Hunter x Hunter',
      time: 'March 8, 1999',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 2,
      imageName: AppImages.two,
      title: 'One Piece',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 3,
      imageName: AppImages.two,
      title: 'Mob Psycho 100',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 4,
      imageName: AppImages.two,
      title: 'Attack on Titan',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 5,
      imageName: AppImages.two,
      title: 'Dragon Ball Z',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 6,
      imageName: AppImages.two,
      title: 'Death Note',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 7,
      imageName: AppImages.two,
      title: 'My Hero Academia',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 8,
      imageName: AppImages.two,
      title: 'Monster ',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 9,
      imageName: AppImages.two,
      title: 'Jojo\'s Bizarre Adventure',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
    Movie(
      id: 10,
      imageName: AppImages.two,
      title: 'Naruto Shippuden',
      time: 'august 6, 2022',
      description:
          '"Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi. It has been serialized in Weekly Shōnen Jump magazine since March 16, 1998, although the manga has frequently',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      'main_scren/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            //
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(movie.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text(movie.time,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
