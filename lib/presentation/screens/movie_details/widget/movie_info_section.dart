import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieInfoSection extends StatelessWidget {
  final String label;
  final Widget child;
  const MovieInfoSection({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 7.w),
          child,
        ],
      ),
    );
  }
}
