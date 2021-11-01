import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_test/shared/theme.dart';
import 'package:skill_test/widgets/date_picker.dart';
import 'package:skill_test/widgets/navigation_item.dart';
import 'package:skill_test/widgets/todolist_item.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          //NOTE : NAVIGATION BAR
          NavigationItem(user: widget._user),
          //NOTE : EXPLORE DATE
          Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //NOTE : DATE NOW
                Text(
                  'Sun, Sept 14 2020',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //NOTE : DATE TIMELINE
                DateTimeline(),
                SizedBox(
                  height: 30,
                ),
                //NOTE : TASK LIST
                Text(
                  'Task List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //START TODOLIST
                TodoList(
                  time: '09.00',
                  timeRange: '09-00 - 09.30',
                  title: 'Daily Stand Up',
                  statusBg: 0,
                  statusRange: 0,
                  statusTitle: 0,
                ),
                TodoList(
                  time: '10.00',
                  timeRange: '10.00 - 11.00 ',
                  title: 'Meeting Client A',
                  statusBg: 1,
                  statusRange: 1,
                  statusTitle: 1,
                ),
                TodoList(
                  time: '12.00',
                  timeRange: '12.00 - 13.00 ',
                  title: 'Meeting Client B',
                  statusBg: 2,
                  statusRange: 2,
                  statusTitle: 2,
                ),
                //END TODOLIST
              ],
            ),
          ),
        ],
      ),
    );
  }
}
