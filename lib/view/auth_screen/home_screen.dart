import 'dart:ffi';

import 'package:cv_maker/resources/consts/consts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, right: 15, left: 15),
            width: double.infinity,
            height: height * 0.25,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    Text(
                      'Resume Builder',
                      style: TextStyle(
                          fontFamily: regular,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
                //-----------
                SizedBox(
                  height: 20,
                ),
                Text(
                  'HI, JAZIB UMER',
                  style: TextStyle(
                      fontFamily: bold,
                      fontSize: 30,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Make Your own cv of your style cv of your style',
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
              ],
            ),

            //--------------------------
          ),
          //---------------
          Stack(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.deepPurple),
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
