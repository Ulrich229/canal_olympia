import 'package:canal_olympia/presentation/screens/movie_details/pages/about_movie.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:canal_olympia/data/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = "/movie-details";
  final Movie movie;
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 10, 20, 69),
        /* 
        extendBodyBehindAppBar: true, */
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(125, 12, 32, 128),
          centerTitle: true,
          title: Text(
            movie.name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: AppBar().preferredSize.height,
              padding: EdgeInsets.only(right: 3.w),
              child: Column(
                children: [
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: const Color.fromARGB(255, 188, 0, 46),
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 188, 0, 46)),
                    tabs: [
                      Tab(
                        key: GlobalKey(debugLabel: "0"),
                        text: "About",
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        key: GlobalKey(debugLabel: "1"),
                        text: "Session",
                        iconMargin: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            AboutMovie(movie: movie),
            const Center(
              child: Text(
                'Coming Soon',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

