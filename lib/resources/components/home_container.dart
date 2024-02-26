import 'package:cv_maker/resources/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeContainer extends StatefulWidget {
  final dynamic height;
  const HomeContainer({super.key, required this.height});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      height: widget.height * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF5D7DB), borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Choose Template',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                'Explore From 100s \nProfessional template',
                maxLines: 2,
                style: TextStyle(fontSize: 12),
              ),
              ElevatedButton(onPressed: () {}, child: Text('READ MORE')),
            ],
          ),
          // Lottie.asset('assets/animations/selectionAnimation.json',
          //  frameRate: FrameRate(100)),
          Image.asset(presentationImage),
        ],
      ),
    );
  }
}
