import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BaseView extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? body;
  final bool? resizeToAvoidBottomInsets;
  final Color backgroundColor;
  final bool showLoading;

  const BaseView({
    Key? key,
    this.padding,
    this.backgroundColor = Colors.white,
    this.resizeToAvoidBottomInsets,
    this.body,
    this.showLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              showLoading
                  ? buildLoadingIndicator()
                  : Container(
                      padding: const EdgeInsets.all(30.0),
                    ),

              //
              SizedBox(
                height: 20.h,
              ),

              //
              Center(
                child: Container(
                  padding: padding ??
                      EdgeInsets.symmetric(
                        horizontal: 100.w * 0.1,
                        vertical: 3.h,
                      ),
                  child: body!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align buildLoadingIndicator() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
      ),
    );
  }
}
