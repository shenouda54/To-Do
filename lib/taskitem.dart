import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            color: Colors.blue,
            height: 90,
            width: 2,
          ),
          SizedBox(
            width: 18,
          ),
          Column(
            children: [
              Text(
                "Text Title ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Text Description ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(80, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(
              Icons.done,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
