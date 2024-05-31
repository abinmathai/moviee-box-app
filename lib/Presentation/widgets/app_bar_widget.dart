import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_box_app/Core/constants.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(title,
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold)),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cast,
                size: 30,
              ),
            ),
            kWidth,
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: const Color.fromARGB(255, 219, 219, 7),
                height: 27,
                width: 27,
              ),
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
