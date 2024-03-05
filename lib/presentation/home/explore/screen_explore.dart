import 'package:dating_vista/core/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorApp,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorWhite,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.favorite, color: colorApp, size: 29),
              Text(
                'NJAN',
                style: GoogleFonts.robotoSlab(color: colorBlack, fontSize: 25),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell_fill,
                color: colorApp,
              ),
            )
          ],
        ),
      )),
    );
  }
}
