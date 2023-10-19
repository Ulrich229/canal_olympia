import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:canal_olympia/data/models/movie.dart';

class MovieCarrousel extends StatefulWidget {
  const MovieCarrousel({
    super.key,
  });

  @override
  State<MovieCarrousel> createState() => _MovieCarrouselState();
}

class _MovieCarrouselState extends State<MovieCarrousel> {
  late ScrollController _controller;
  late int focusItemIndex;
  late double itemWidth;

  @override
  void initState() {
    super.initState();
    focusItemIndex = 0;
    itemWidth = 60.w + 10;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    final x = _controller.offset / itemWidth;
    if (x - x.truncate() > 0.6) {
      setState(() {
        focusItemIndex = x.truncate() + 1;
      });
    }
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        focusItemIndex = x.truncate() + 1;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        focusItemIndex = 0;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 45.h,
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: demoMovies
                  .sublist(0, 4)
                  .map(
                    (movie) => MovieCarrouselItem(
                      movie: movie,
                      isFocused: focusItemIndex == demoMovies.indexOf(movie),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) => MovieCarrouselIndexIndicator(
                isSelected: index == focusItemIndex,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MovieCarrouselIndexIndicator extends StatelessWidget {
  final bool isSelected;
  const MovieCarrouselIndexIndicator({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 1.h,
      width: isSelected ? 5.w : 1.h,
      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.white : Colors.white24,
      ),
    );
  }
}

class MovieCarrouselItem extends StatelessWidget {
  final Movie movie;
  final bool isFocused;
  const MovieCarrouselItem({
    Key? key,
    required this.movie,
    required this.isFocused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isFocused ? 45.h : 35.h,
      width: 60.w,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(movie.corver),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 45.h / 2,
            width: 60.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
          ),
          Container(
            height: isFocused ? 45.h : 35.h,
            width: 60.w,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 10.sp,
                    backgroundColor: Colors.black54,
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: Image.asset("assets/icons/Sound.png"),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  movie.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: movie.tags
                      .map(
                        (tag) => MovieTagItem(tag: tag),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          isFocused
              ? Container(
                  height: isFocused ? 45.h : 35.h,
                  width: 60.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w / 2 - 17.sp,
                    vertical: 45.h / 2 - 17.sp,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.sp),
                    clipBehavior: Clip.antiAlias,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Container(
                          height: 5.w,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/icons/Play.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class MovieTagItem extends StatelessWidget {
  final String tag;
  const MovieTagItem({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 0.5.h,
      ),
      margin: EdgeInsets.only(right: 1.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.08)),
      child: Text(
        tag,
        style: TextStyle(
          color: Colors.white,
          fontSize: 7.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
