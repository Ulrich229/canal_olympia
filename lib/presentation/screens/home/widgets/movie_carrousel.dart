// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

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
    //log(_controller.offset.toString());
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
    log(focusItemIndex.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: demoMovies
              .map((movie) => MovieCarrouselItem(
                    movie: movie,
                    isFocused: focusItemIndex == demoMovies.indexOf(movie),
                  ))
              .toList(),
        ),
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
      duration: Duration(milliseconds: 500),
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
    );
  }
}
