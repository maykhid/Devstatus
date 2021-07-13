import 'package:dev_stat/app/base_view.dart';
import 'package:dev_stat/app/consts/app_colors.dart';
import 'package:dev_stat/core/models/git_profile_model.dart';
import 'package:dev_stat/ui/widgets/entry_text.dart';
import 'package:dev_stat/ui/widgets/underline_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dev_stat/app/extensions/extensions.dart';

class DevInfo extends StatefulWidget {
  final GitProfileModel data;
  DevInfo({required this.data});

  @override
  _DevInfoState createState() => _DevInfoState();
}

class _DevInfoState extends State<DevInfo> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: AppColors.deepBlue,
      body: Container(
        height: 70.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name
            buildDevName(),

            // bio
            buildDevBio(),

            SizedBox(
              height: 3.h,
            ),

            // following status
            buildDevFollowStatus(),

            SizedBox(
              height: 6.h,
            ),

            // About / check
            buildAboutCheck(context),

            SizedBox(
              height: 4.h,
            ),

            // dev details
            buildDevDetails(),
          ],
        ),
      ),
    );
  }

  Expanded buildDevDetails() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    EntryText(
                      text: 'Repositories',
                      subtext: '${widget.data.publicRepos}',
                    ),
                    EntryText(
                      text: 'Location',
                      subtext: '${widget.data.location}',
                    ),
                    EntryText(
                      text: 'Website',
                      subtext: '${widget.data.blog}',
                    ),
                    EntryText(
                      text: 'Status',
                      subtext: GitProfileModel.statusInfo(widget.data),
                    ),
                    EntryText(
                      text: 'Joined',
                      subtext:
                          GitProfileModel.formatDate(widget.data.createdAt),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // dev avatar
          buildDevAvatar(),
        ],
      ),
    );
  }

  Align buildDevAvatar() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 10.h,
        height: 15.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${widget.data.avatarUrl}'),
          ),
        ),
      ),
    );
  }

  Row buildAboutCheck(BuildContext context) {
    return Row(
      children: [
        UnderlinedText(text: 'About ${widget.data.login.capitalize()}'),
        SizedBox(
          width: 5.w,
        ),
        UnderlinedText(
            text: 'Check',
            onTap: () {
              Navigator.pop(context);
            }),
      ],
    );
  }

  Row buildDevFollowStatus() {
    return Row(
      children: [
        Text(
          '${widget.data.following} Following',
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
        SizedBox(width: 5.w),
        Text(
          '${widget.data.followers} Followers',
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ],
    );
  }

  Padding buildDevBio() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        widget.data.bio,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w100,
          color: Colors.white,
        ),
      ),
    );
  }

  Text buildDevName() {
    return Text(
      widget.data.name,
      style: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
