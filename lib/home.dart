import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/add_task_bottomsheet.dart';
import 'package:todo/tabs/settings.dart';
import 'package:todo/tabs/tasks.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffDFECDB),
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "TO DO",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskBottomSheet(),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 33,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          iconSize: 33,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    TaskTab(),
    SettingTab(),
  ];
}
