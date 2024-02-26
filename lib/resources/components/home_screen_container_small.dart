import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SmallContainer extends StatelessWidget {
  final dynamic width;
  final dynamic height;
  final String mainHeading;
  final String subHeading;
  final String assetImage;
  final Color color;
  final VoidCallback onPress;
  const SmallContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.mainHeading,
      required this.subHeading,
      required this.assetImage,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      margin: const EdgeInsets.all(13),
      width: width * 0.4,
      height: height * 0.2,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: Offset(6, 6),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.28,
            child: Image.asset(
              assetImage,
              fit: BoxFit.contain,

              //color: Colors.black,
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Text(
            mainHeading,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subHeading,
            maxLines: 2,
            style: TextStyle(fontSize: 12),
          ),
          //Text('sfsaf'),
        ],
      ),
    );
  }
}
