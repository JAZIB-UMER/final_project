import 'package:cv_maker/resources/color.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        child: loading
            ? const CircularProgressIndicator(
                color: AppColors.whiteColor,
              )
            : Text(title),
      ),
    );
  }
}
