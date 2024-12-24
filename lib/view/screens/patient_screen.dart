import 'package:flutter/material.dart';
import 'package:mytal/view/screens/patient_view.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),
      body: const PatientView(),
    );
  }
}
