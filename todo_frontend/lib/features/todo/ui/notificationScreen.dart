import 'package:flutter/material.dart';
import 'package:todo_frontend/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = 120;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.accentColor,
          ),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.accentColor,
              ),
              child: Center(
                child: Icon(Icons.arrow_back, size: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        width: screenWidth,
        height: screenHeight - appBarHeight,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 1,
              color: AppColors.accentColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: screenWidth,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AI task completed",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.fontColorBlack,
                    ),
                  ),
                  Text(
                    "AI task completed good job yohan congratulations",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.labelTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
