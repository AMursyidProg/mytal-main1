import 'package:flutter/material.dart';
import 'package:mytal/view/screens/prescription_screen.dart';
import 'package:mytal/view/widgets/add_appointment_dialog.dart';

class CalendarActionButton extends StatelessWidget {
  const CalendarActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        offset: const Offset(10, 50),
        child: TextButton.icon(
          onPressed: null,
          icon: Icon(
            Icons.event,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            'Events',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        onSelected: (value) {
          switch (value) {
            case 'appointment':
              showDialog(
                context: context,
                builder: (context) => const AddAppointmentDialog(),
              );
              break;
            case 'prescription':
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PrescriptionScreen()));
              break;
          }
        },
        itemBuilder: (BuildContext bc) {
          return const [
            PopupMenuItem(
              value: 'appointment',
              child: Text("Add Appointment"),
            ),
            PopupMenuItem(
              value: 'prescription',
              child: Text("Prescriptions"),
            ),
          ];
        });
  }
}
