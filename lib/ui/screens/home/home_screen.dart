import 'dart:ui';

import 'package:dev_stat/core/services/connectivity/network_connectivity.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:dev_stat/app/base_view.dart';
import 'package:dev_stat/app/base_viewmodel/base_viewmodel.dart';
import 'package:dev_stat/app/consts/app_colors.dart';
import 'package:dev_stat/ui/screens/home/home_screen_viewmodel.dart';
import 'package:dev_stat/ui/widgets/buttons.dart';
import 'package:dev_stat/ui/widgets/container_text_field.dart';
import 'package:dev_stat/ui/widgets/underline_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeScreenViewModel, NetworkConnectivity>(
      builder: (context, model, model2, _) {
        return BaseView(
          backgroundColor: AppColors.deepBlue,
          showLoading: model.state == ViewState.Busy,
          body: Center(
            child: CheckStatus(
              model: model,
              model2: model2,
            ),
          ),
        );
      },
    );
  }
}

class CheckStatus extends StatelessWidget {
  final HomeScreenViewModel model;
  final NetworkConnectivity model2;

  CheckStatus({required this.model, required this.model2});

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
          buildDevStatusText(),

          SizedBox(
            height: 8.h,
          ),

          // check text
          buildUnderlinedText(),

          (model.displayMessanger)
              ? MessangerWidget(message: model.message)
              : Container(),

          // enter username
          Padding(
            padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
            child: buildTextFormField(),
          ),

          // check status button
          Button.flatterButton(
            onTap: () async {
              model.validateInput(context, model2);
            },
            isLoading: model.isBusy(),
          ),
        ],
      ),
    );
  }

  ContainerTextFormField buildTextFormField() {
    return ContainerTextFormField(
      controller: model.usernameController,
      hintText: 'Enter GitHub Username',
    );
  }

  UnderlinedText buildUnderlinedText() {
    return UnderlinedText(
      text: 'Check',
    );
  }

  Text buildDevStatusText() {
    return Text(
      'Developer Status',
      style: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white),
    );
  }
}

class MessangerWidget extends StatelessWidget {
  const MessangerWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 3.h,
      ),
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Text(
              message,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(5),
            bottom: Radius.circular(5),
          ),
          border: Border.all(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
