import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 60,
          ),
        ),
      ],
    );
  }
}
