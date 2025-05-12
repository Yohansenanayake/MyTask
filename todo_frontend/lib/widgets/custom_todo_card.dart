import 'package:flutter/material.dart';
import 'package:todo_frontend/constants/colors.dart';

class CustomTodoCard extends StatefulWidget {
  final String cardTitle;
  final bool isTaskCompleted;
  const CustomTodoCard({
    super.key,
    required this.cardTitle,
    required this.isTaskCompleted,
  });

  @override
  State<CustomTodoCard> createState() => _CustomTodoCardState();
}

class _CustomTodoCardState extends State<CustomTodoCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 70,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.accentColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Radio(
            value: widget.isTaskCompleted ? 1 : 0,
            groupValue: 0,
            onChanged: (value) {},
          ),
          Text(
            widget.cardTitle,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:
                  widget.isTaskCompleted ? Colors.black : AppColors.accentColor,
            ),
          ),
          Spacer(),
          widget.isTaskCompleted
              ? SizedBox()
              : Column(
                children: [
                  Spacer(),
                  Icon(Icons.edit),
                  SizedBox(height: 5),
                  Icon(Icons.delete, color: Colors.red),
                  Spacer(),
                ],
              ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
