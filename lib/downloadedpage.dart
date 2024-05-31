import 'package:flutter/material.dart';

import 'package:movie_box_app/Core/Colors/colors.dart';

import 'package:url_launcher/url_launcher.dart';

class Downloadpage extends StatelessWidget {
  final String VideoUrl = 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
        backgroundColor: Colors.blueGrey, // Change the title as per your requirement
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            launch(VideoUrl); 
          },
          icon: const Icon(
            Icons.play_arrow,
            color: kButtonBlack,
          ),
          label: const Text(
            'Downloaded files',
            style: TextStyle(color: kButtonWhite, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kButtonBlack),
          ),
        ),
      ),
    );
  }
}
