import 'package:flutter/material.dart';

import '../shared/components/Widgets/bottomNavBar.dart';
import '../shared/components/Widgets/movieCard.dart';
import '../shared/components/constants.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, height: 50),
            SizedBox(width: 16),
            Text('IMDB'),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, child: Image.asset(kBlurBackground)),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top 100 Movie',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    movieCard(
                      movieimage:
                          'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg',
                      movieName: 'The Shawshank Redemption',
                      moviegenre: 'Drama',
                      movieYear: '1994',
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
