import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const CustomButtonText({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
