import 'package:flutter/material.dart';
import 'package:mytal/view/screens/report_view.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      body: const ReportView(),
    );
  }
}
