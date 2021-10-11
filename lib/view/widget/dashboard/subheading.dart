import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  const SubHeading({Key? key, this.title, this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: SelectableText(
          title!,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: titleColor, fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
