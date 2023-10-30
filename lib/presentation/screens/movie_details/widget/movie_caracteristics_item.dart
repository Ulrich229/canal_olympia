import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieCaracteristicsItem extends StatelessWidget {
  final double value;
  final String label;
  const MovieCaracteristicsItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
