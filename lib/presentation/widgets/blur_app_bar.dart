import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BlurAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget content;
  final Widget? bottom;
  const BlurAppBar({
    Key? key,
    required this.content,
    this.bottom,
  }) : super(key: key);
  @override
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight * 2);

  @override
  State<BlurAppBar> createState() => _BlurAppBarState();
}

class _BlurAppBarState extends State<BlurAppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarChild = Container(
      height: widget.preferredSize.height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      color: const Color.fromARGB(
        125,
        12,
        32,
        128,
      ),
      child: Column(
        children: [
          Expanded(
            child: widget.content,
          ),
          if (widget.bottom != null)
            Expanded(
              child: Row(
                children: [Expanded(child: widget.bottom!)],
              ),
            ),
        ],
      ),
    );
    if (_scrolledUnder) {
      appBarChild = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 60,
            sigmaY: 60,
          ),
          child: appBarChild,
        ),
      );
    }

    return appBarChild;
  }
}
