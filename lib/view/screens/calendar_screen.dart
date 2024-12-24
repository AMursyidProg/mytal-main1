import 'package:flutter/material.dart';
import 'package:mytal/view/screens/calendar_view.dart';
import 'package:mytal/view/widgets/calendar_action_button.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracker"),
        actions: const [
          CalendarActionButton(),
        ],
      ),
      body: const CalendarView(),
    );
  }
}
