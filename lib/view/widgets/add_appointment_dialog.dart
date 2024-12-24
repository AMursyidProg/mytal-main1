import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/profile_appointment_model.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class AddAppointmentDialog extends StatefulWidget {
  final ProfileAppointmentModel? appointment;
  final Function? onSave;
  final int? patientId;
  const AddAppointmentDialog({
    Key? key,
    this.appointment,
    this.onSave,
    this.patientId,
  }) : super(key: key);

  @override
  State<AddAppointmentDialog> createState() => _AddAppointmentDialog();
}

class _AddAppointmentDialog extends State<AddAppointmentDialog> {
  final TextEditingController _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _timeController = TextEditingController(text: "10:00");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  bool _isDeleting = false;
  String? _errorMessage;
  List<String> intervals = <String>[];

  @override
  void initState() {
    super.initState();
    if (widget.appointment != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.appointment!.date));
      _timeController.text = DateFormat('HH:mm').format(DateTime.parse(widget.appointment!.date));
      _nameController.text = widget.appointment!.name;
      _locationController.text = widget.appointment?.location ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.appointment != null ? 'Edit' : 'Add'} Appointment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Date",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: widget.appointment != null ? DateTime.parse(widget.appointment!.date) : DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            _dateController.text = formattedDate;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the date.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _timeController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.access_time),
                          labelText: "Time",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime initialTime = DateTime.parse(_dateController.text).copyWith(
                            hour: int.parse(_timeController.text.split(":")[0]),
                            minute: int.parse(_timeController.text.split(":")[1]),
                          );

                          TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(initialTime));
                          if (time != null) {
                            String formattedTime = time.format(context);
                            _timeController.text = formattedTime;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the time.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.edit),
                          labelText: "Title",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the title.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _locationController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_on),
                          labelText: "Location",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      if (_errorMessage != null) ErrorBox(error: _errorMessage!),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Row(
                children: [
                  Column(
                    children: [
                      widget.appointment == null
                          ? const SizedBox()
                          : TextButton(
                              onPressed: () {
                                // Confirm delete
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (context, setState) {
                                      return AlertDialog(
                                        title: const Text('Confirm Delete'),
                                        content: const Text('Are you sure you want to delete this appointment?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          Consumer(builder: (context, ref, _) {
                                            var prefsState = ref.watch(prefsProvider);
                                            return ElevatedButton(
                                              onPressed: () async {
                                                if (_isDeleting == true) return;

                                                setState(() {
                                                  _isDeleting = true;
                                                });

                                                try {
                                                  // await GetIt.I.get<ApiClient>().deleteFerritin(widget.prescription!.id);
                                                  // widget.onSave?.call();

                                                  final List<ProfileAppointmentModel> appointmentList = prefsState[AppConstants.profileAppointments];
                                                  appointmentList.removeWhere((element) => element.id == widget.appointment!.id);
                                                  ref.read(prefsProvider.notifier).setList(AppConstants.profileAppointments, appointmentList);

                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(content: Text('Deleted apppointment')),
                                                    );

                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  }
                                                } catch (e, s) {
                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(e.toString() + s.toString()),
                                                      ),
                                                    );
                                                  }
                                                }
                                                setState(() {
                                                  _isDeleting = false;
                                                });
                                              },
                                              child: _isDeleting == true
                                                  ? SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: Theme.of(context).primaryColor,
                                                      ),
                                                    )
                                                  : const Text("Delete"),
                                            );
                                          }),
                                        ],
                                      );
                                    });
                                  },
                                );
                              },
                              child: const Text('Delete')),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeDefault),
                  Consumer(builder: (context, ref, _) {
                    var prefsState = ref.watch(prefsProvider);
                    return SaveButton(
                      loading: _isSubmitting,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isSubmitting = true;
                          });
                          try {
                            DateTime date = DateTime.parse(_dateController.text).copyWith(
                              hour: int.parse(_timeController.text.split(":")[0]),
                              minute: int.parse(_timeController.text.split(":")[1].substring(0, 2)),
                            );

                            int appointmentId = UniqueKey().hashCode;

                            ProfileAppointmentModel appointment = ProfileAppointmentModel(
                              id: appointmentId,
                              date: date.toIso8601String(),
                              name: _nameController.text,
                              location: _locationController.text,
                            );

                            if (prefsState[AppConstants.profileAppointments] == null) {
                              final List<ProfileAppointmentModel> appointmentList = [];
                              ref.read(prefsProvider.notifier).setList(AppConstants.profileAppointments, appointmentList);
                            }

                            if (widget.appointment != null) {
                              appointment = appointment.copyWith(id: widget.appointment!.id);
                              final List<ProfileAppointmentModel> appointmentList = prefsState[AppConstants.profileAppointments];
                              appointmentList.removeWhere((element) => element.id == widget.appointment!.id);
                              appointmentList.add(appointment);
                              appointmentList.sort((a, b) => b.date.compareTo(a.date));

                              ref.read(prefsProvider.notifier).setList(AppConstants.profileAppointments, appointmentList);

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Updated Appointment')),
                                );
                              }
                            } else {
                              final List<ProfileAppointmentModel> appointmentList = prefsState[AppConstants.profileAppointments];
                              appointmentList.add(appointment);
                              appointmentList.sort((a, b) => b.date.compareTo(a.date));
                              ref.read(prefsProvider.notifier).setList(AppConstants.profileAppointments, appointmentList);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added Appointment')),
                                );
                              }
                            }

                            if (context.mounted) Navigator.pop(context);
                          } catch (e, s) {
                            setState(() {
                              _errorMessage = e.toString() + s.toString();
                            });
                          }

                          setState(() {
                            _isSubmitting = false;
                          });
                        }
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
