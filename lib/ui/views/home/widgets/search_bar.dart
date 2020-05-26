import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: LocationSelector()),
        SizedBox(width: 40.w),
        FlagSelector(),
      ],
    );
  }
}