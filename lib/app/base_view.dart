import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BaseView extends StatelessWidget {
  // final Widget body;
  final EdgeInsets? padding;
  final Widget? body;
  final bool? resizeToAvoidBottomInsets;
  final Color backgroundColor;

  const BaseView({
    Key? key,
    this.padding,
    this.backgroundColor = Colors.white,
    this.resizeToAvoidBottomInsets,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 1.0,),
                ),
              ),
        
              SizedBox(
                height:20.h,
              ),
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
}
