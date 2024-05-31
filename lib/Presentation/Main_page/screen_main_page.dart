import 'package:flutter/material.dart';

import 'package:movie_box_app/Presentation/Downloads/screen_downloads.dart';
import 'package:movie_box_app/Presentation/Home/screen_home.dart';
import 'package:movie_box_app/Presentation/Main_page/widgets/bottom_nav.dart';
import 'package:movie_box_app/Presentation/New_&_Hot/screen_new_and_hot.dart';
import 'package:movie_box_app/Presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int value, _) {
            return _pages[value];
          }),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
