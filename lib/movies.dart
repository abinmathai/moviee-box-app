import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder data for movie information
    String movieTitle = "Movies";
    
    // List of image URLs
    List<String> movieImageUrls = [
      "https://image.tmdb.org/t/p/w500/bvYjhsbxOBwpm8xLE5BhdA3a8CZ.jpg",
      "https://image.tmdb.org/t/p/w500/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
      "https://upload.wikimedia.org/wikipedia/en/f/f5/Damsel_2024_poster2.jpg",
      "https://m.media-amazon.com/images/M/MV5BZDVkZmI0YzAtNzdjYi00ZjhhLWE1ODEtMWMzMWMzNDA0NmQ4XkEyXkFqcGdeQXVyNzYzODM3Mzg@._V1_.jpg",
      "https://reviewpuram.in/wp-content/uploads/2024/02/Manjummel-Boys-Poster.jpg",
      "https://miro.medium.com/v2/resize:fit:910/1*sBgl0or1AI66RvzsBWnv8Q.jpeg",
      
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemCount: movieImageUrls.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movieImageUrls[index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            );
          },
        ),
      ),
    );
  }
}


