import 'package:dev_stat/app/base_view.dart';
import 'package:dev_stat/app/consts/app_colors.dart';
import 'package:dev_stat/ui/widgets/buttons.dart';
import 'package:dev_stat/ui/widgets/entry_text.dart';
import 'package:dev_stat/ui/widgets/underline_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: AppColors.deepBlue,
      body: Center(
        // dev status
        child: DevStatus(),
        // child: CheckStatus(),
      ),
    );
  }
}

class DevStatus extends StatelessWidget {
  const DevStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      height: 70.h,
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          Text(
            'Henry',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          SizedBox(
            height: 6.h,
          ),

          // following status
          Row(
            children: [
              Text(
                '6 Following',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                '6 Following',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ],
          ),

          SizedBox(
            height: 6.h,
          ),

          // About / check
          Row(
            children: [
              UnderlinedText(text: 'About Maykhid'),
              SizedBox(
                width: 5.w,
              ),
              UnderlinedText(text: 'Check'),
            ],
          ),

          SizedBox(
            height: 4.h,
          ),

          // details
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      // color: Colors.amber,
                      padding: EdgeInsets.only(left: 2.w),
                      height: 30.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                         
                          EntryText(text: 'Repositories', subtext: '8',),
                          EntryText(text: 'Location', subtext: 'Not Provided',),
                          EntryText(text: 'Website', subtext: 'Not Provied',),
                          EntryText(text: 'Status', subtext: 'Upcoming Open Source Engineer',),
                          EntryText(text: 'Joined', subtext: 'September 3rd, 2019',),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 50.w,
                // ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 10.h,
                    height: 15.w,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CheckStatus extends StatelessWidget {
  const CheckStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: 100.w,
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // dev status
          Text(
            'Developer Status',
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),

          SizedBox(
            height: 10.h,
          ),

          // check
          UnderlinedText(
            text: 'Check',
          ),

          SizedBox(
            height: 4.h,
          ),

          // enter username
          Container(
            width: double.infinity,
            height: 7.h,
            color: Colors.white,
          ),

          SizedBox(
            height: 3.h,
          ),

          // check status button
          Button.flatterButton(),
          
        ],
      ),
    );
  }
}


