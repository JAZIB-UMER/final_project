import 'dart:ui';

import 'package:cv_maker/resources/consts/color.dart';
import 'package:cv_maker/view/splash_screen/splash_services.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  const CustomDrawer(
      {super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final SplashServices splashServices = SplashServices();
    return Drawer(
      // backgroundColor: lightBlue,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [darkBlue, lightBlue],
          ),
          // color: lightBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          userEmail,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Update the UI based on the item selected
                      // Navigator.pop(context); // Closes the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Update the UI based on the item selected
                      // Navigator.pop(context); // Closes the drawer
                    },
                  ),
                ],
              )),
              const Spacer(),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  splashServices.logOut(context);
                  // Update the UI based on the item selected
                  // Navigator.pop(context); // Closes the drawer
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
