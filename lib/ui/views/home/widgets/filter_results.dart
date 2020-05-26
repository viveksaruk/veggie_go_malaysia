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
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            80.0,
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          0.0,
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                80.0,
                              ),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Nearest',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
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

