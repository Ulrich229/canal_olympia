import 'package:canal_olympia/data/models/movie.dart';
import 'package:flutter/material.dart';

import 'package:canal_olympia/presentation/screens/movie_details/widget/movie_caracteristics_item.dart';
import 'package:canal_olympia/presentation/screens/movie_details/widget/movie_demo_video_card.dart';
import 'package:canal_olympia/presentation/screens/movie_details/widget/movie_info_section.dart';
import 'package:canal_olympia/presentation/widgets/default_button.dart';
import 'package:sizer/sizer.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        MovieDemoVideoCard(movie: movie),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(0, 7, 14, 50),
                Color.fromARGB(255, 7, 14, 50),
              ],
            ),
          ),
          child: const IntrinsicHeight(
            child: Row(
              children: [
                MovieCaracteristicsItem(
                  value: 8.3,
                  label: 'IMDB',
                ),
                VerticalDivider(color: Colors.grey),
                MovieCaracteristicsItem(
                  value: 7.9,
                  label: 'Kinopoisk',
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                Text(
                  "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
                SizedBox(height: 1.h),
                MovieInfoSection(
                  label: "Certificate",
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "16+",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                MovieInfoSection(
                  label: "Runtime",
                  child: Text(
                    "02:56",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                MovieInfoSection(
                  label: "Release",
                  child: Text(
                    "2023",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                MovieInfoSection(
                  label: "Genre",
                  child: Text(
                    "Action, Crime, Drama",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                MovieInfoSection(
                  label: "Genre",
                  child: Text(
                    "Action, Crime, Drama",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                MovieInfoSection(
                  label: "Director",
                  child: Text(
                    "Matt Reeves",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                MovieInfoSection(
                  label: "Cast",
                  child: Expanded(
                    child: Text(
                      "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, 	Andy Serkis, Peter Sarsgaard",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 10.h,
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 1.h,
          ),
          child: DefaultButton(
            label: "Select session",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
