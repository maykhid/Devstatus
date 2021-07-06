import 'package:flutter/material.dart';

class EntryText extends StatelessWidget {
  final String text;
  final String subtext;
  const EntryText({
    required this.text,
    required this.subtext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$text: ',
        style: TextStyle(fontWeight: FontWeight.w100),
        children: [
          TextSpan(
              text: '$subtext', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}