import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';

import 'widgets/result_list_view.dart';
import 'widgets/filter_results.dart';
import 'widgets/quick_search.dart';
import 'widgets/annoucment_carousel.dart';
import 'widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.w, vertical: 80.h),
                  child: SearchBar(),
                ),
                AnnouncementCarousel(),
                QuickSearch(),
                FilterResults(),
                ResultsListView(),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}