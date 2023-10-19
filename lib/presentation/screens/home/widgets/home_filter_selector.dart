// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:canal_olympia/business_logic/cubits/home_filter/home_filter_cubit.dart';

class HomeFilterSelector extends StatelessWidget {
  const HomeFilterSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFilterCubit, HomeFilterState>(
      builder: (context, state) {
        return SizedBox(
          width: 100.w,
          height: 5.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HomeFIlterItem(
                filterLabel: state.filters[index],
                isSelected: index == state.selectedFilterIndex,
                onTap: () {
                  BlocProvider.of<HomeFilterCubit>(context).changeFilter(index);
                },
              );
            },
            itemCount: state.filters.length,
          ),
        );
      },
    );
  }
}

class HomeFIlterItem extends StatelessWidget {
  final bool isSelected;
  final String filterLabel;
  final VoidCallback onTap;
  const HomeFIlterItem({
    Key? key,
    required this.isSelected,
    required this.filterLabel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 2.w),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 4.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(isSelected ? 255 : 20, 255, 255, 255),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              filterLabel,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 10.sp,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 10.sp,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
