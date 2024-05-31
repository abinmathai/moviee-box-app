import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_box_app/Application/downloads/downloads_bloc.dart';
import 'package:movie_box_app/Application/hot_and_new/hot_and_new_bloc.dart';
import 'package:movie_box_app/Application/search/search_bloc.dart';
import 'package:movie_box_app/Core/Colors/colors.dart';
import 'package:movie_box_app/Core/di/injectable.dart';
import 'package:movie_box_app/splashe.dart';

import 'Application/home/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjectable();

  //  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotAndNewBloc>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme:ThemeData.dark(),
          title: 'Movie Box App',
          theme: ThemeData(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              scaffoldBackgroundColor: kBackgroundColor,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: kWhiteFont),
                bodyMedium: TextStyle(color: kWhiteFont),
                bodySmall: TextStyle(color: kWhiteFont),
              ),
              iconTheme: const IconThemeData(color: kWhiteBackground)),
          home: SplashScreen()),
    );
  }
}