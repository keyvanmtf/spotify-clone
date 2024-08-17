import 'package:flutter/material.dart';

class BasicBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  const BasicBtn(
      {required this.onPressed, super.key, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 80)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ));
  }
}
