import 'package:flutter/material.dart';
import 'package:todo_frontend/constants/colors.dart';
import 'package:todo_frontend/widgets/custom_todo_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double firstContainerHeight = 250;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Saturday Feb 2 2025",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(),
            Image.asset("assets/images/notification.png"),
          ],
        ),
      ),
      body: SizedBox(
        height: screenHeight - AppBar().preferredSize.height,
        width: screenWidth,
        child: Column(
          children: [
            Expanded(
              child: Container(
                //color: Colors.amber,
                height: firstContainerHeight,
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Philip",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Have a nice day!",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Todays Progress",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 76,
                      width: screenWidth,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/menu.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            "Progress",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.8,
                            color: Colors.white,
                            backgroundColor: AppColors.progressBGColor,
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "80%",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              height:
                  screenHeight -
                  (AppBar().preferredSize.height + firstContainerHeight),
              width: screenWidth,
              //color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                    child: Text(
                      "Daily Tasks",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        screenHeight -
                        (AppBar().preferredSize.height +
                            firstContainerHeight +
                            25),
                    width: screenWidth,
                    child: Column(
                      children: [
                        CustomTodoCard(cardTitle: "Work out", isTaskCompleted: false),
                        CustomTodoCard(cardTitle: "Work out 2", isTaskCompleted: false),
                        CustomTodoCard(cardTitle: "Work out 3", isTaskCompleted: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.accentColor,
        onPressed: () {},
        label: Row(
          children: [
            Icon(Icons.add, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Add Task",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
