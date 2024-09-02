import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = "edit_task";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      backgroundColor: Color(0xffDFECDB),
      appBar: AppBar(
        toolbarHeight: 130,
        title: Text(
          "To Do List",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 33),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Edit Task",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                TextFormField(
                  initialValue: model.title,
                  onChanged: (value) {
                    model.title = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Title",
                    suffixStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
                Spacer(),
                TextFormField(
                  initialValue: model.description,
                  onChanged: (value) {
                    model.description = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Task details",
                    suffixStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    DateTime? newDate = await chooseYourDate();
                    if (newDate != null) {
                      model.date = newDate.millisecondsSinceEpoch;
                      setState(() {});
                    }
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Select time",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Text(
                  DateFormat.yMd().format(
                    DateUtils.dateOnly(
                        DateTime.fromMillisecondsSinceEpoch(model.date ?? 0)),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 60,
                    ),
                  ),
                  onPressed: () async {
                    await FirebaseFunction.updateTask(model);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
    return chosenDate;
  }
}
