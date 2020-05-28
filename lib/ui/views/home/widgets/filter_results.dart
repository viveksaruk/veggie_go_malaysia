import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 80.w,
        left: 80.w,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  'Results',
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 90.h,
                      width: 290.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            120.h,
                          ),
                        ),
                        child: Text( 'Nearest', textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40.w),
                      width: 70.w,
                      height: 70.w,
                      child: Image.asset('assets/icons/filterEmpty.png'),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

