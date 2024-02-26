import 'package:cv_maker/resources/consts/color.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final dynamic height;
  final dynamic width;
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height * 0.07,
        width: width * 0.8,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: whiteColor,
                )
              : Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
