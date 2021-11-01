import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:skill_test/shared/theme.dart';

class DateTimeline extends StatefulWidget {
  const DateTimeline({Key? key}) : super(key: key);

  @override
  State<DateTimeline> createState() => _DateTimelineState();
}

class _DateTimelineState extends State<DateTimeline> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: kPrimaryColor,
            selectedTextColor: kWhiteColor,
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ],
      ),
    );
  }
}