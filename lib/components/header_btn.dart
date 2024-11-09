import 'package:flutter/material.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class HeaderBtn extends StatelessWidget {
  const HeaderBtn({super.key, required this.text, required this.onPressed});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(AppConst.grey),
          overlayColor: WidgetStateProperty.all<Color>(Colors.transparent)),
      child: Text(text),
    );
  }
}
