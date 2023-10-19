import 'dart:ui';

import 'package:canal_olympia/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          mainAxisSpacing: 3.w,
          crossAxisSpacing: 3.w),
      itemBuilder: (_, index) => MoviesGridItem(
        movie: demoMovies[index],
      ),
      itemCount: demoMovies.length,
    );
  }
}

class MoviesGridItem extends StatelessWidget {
  final Movie movie;
  const MoviesGridItem({
    super.key,
    required this.movie,
  });

  String getDurationString() {
    final int hours = (movie.duration / 60).truncate();
    final int minutes = movie.duration - hours * 60;
    return "${getTwoDigitNumber(hours)}h${getTwoDigitNumber(minutes)}";
  }

  String getTwoDigitNumber(int number) {
    if (number > 9) {
      return '$number';
    } else {
      return '0$number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.w),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    movie.corver,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -5),
                    blurRadius: 35,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  BoxShadow(
                    offset: const Offset(-5, 0),
                    blurRadius: 35,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  BoxShadow(
                    offset: const Offset(-5, -5),
                    blurRadius: 35,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(
                          movie.corver,
                        ),
                        fit: BoxFit.cover),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 2.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromARGB(255, 188, 0, 46),
                    ),
                    child: Text(
                      getDurationString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                movie.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                movie.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
