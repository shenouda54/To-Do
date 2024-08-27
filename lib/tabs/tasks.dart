import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/taskitem.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 356)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.blue,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.blue,
          selectableDayPredicate: (date) => date.day != 0,
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 34,
        ),
        Expanded(
           child: StreamBuilder(
            stream: FirebaseFunction.getTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("try again"))
                  ],
                );
              }
              var  tasks = snapshot.data?.docs.map((e)=> e.data()).toList();

              if(tasks?.isEmpty?? true){
                return Text("No Tasks");
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(model: tasks[index],);
                },
                itemCount: tasks!.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
