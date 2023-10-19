import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBarChoiceButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  const AppBarChoiceButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: kTextTabBarHeight / 2.3,
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
