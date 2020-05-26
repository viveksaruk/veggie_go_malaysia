import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';

class QuickSearch extends StatelessWidget {
  static Widget _customIcon(Color color, String text) {
    return SizedBox(
      width: 220.w,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 80.w,
            backgroundColor: color,
          ),
          SizedBox(height: 10.h),
          Text(text),
        ],
      ),
    );
  }

  final List<Widget> _quickIconsFirst = [
    _customIcon(ThemeColors.searchBarIcon, 'Japanese'),
    _customIcon(ThemeColors.searchBarIcon, 'Chinese'),
    _customIcon(ThemeColors.searchBarIcon, 'Western'),
    _customIcon(ThemeColors.searchBarIcon, 'Indian'),
  ];
  final List<Widget> _quickIconsSecond = [
    _customIcon(ThemeColors.searchBarIcon, 'Korean'),
    _customIcon(ThemeColors.searchBarIcon, 'Thai'),
    _customIcon(ThemeColors.searchBarIcon, 'Mixed'),
    _customIcon(ThemeColors.searchBarIcon, 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _quickIconsFirst,
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _quickIconsSecond,
          )
        ],
      ),
    );
  }
}