import 'package:flutter/material.dart';

class movieCard extends StatelessWidget {
  const movieCard({required this.movieimage,required this.movieName,required this.moviegenre,required this.movieYear});
  final String movieimage;
  final String movieName;
  final String moviegenre;
  final String movieYear;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              movieimage,
              height: 190,
              width: 130,
            ),
          ),
          SizedBox(height: 8),
          Text(
            movieName!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(children: [Text(moviegenre), Text('-'), Text(movieYear)]),
        ],
      ),
    );
  }
}
