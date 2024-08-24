import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Add New Task",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Description",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Select Date",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "3/3/2005",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          Container(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {

            }, child: Text("Add",style: TextStyle(
              fontSize: 20,
            ),)),
          )
        ],
      ),
    );
  }
}
