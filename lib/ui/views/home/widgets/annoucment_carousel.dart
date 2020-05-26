import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';

class AnnouncementCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ThemeColors.searchBarIcon,
          ),
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: false,
        height: 500.h,
      ),
    );
  }
}