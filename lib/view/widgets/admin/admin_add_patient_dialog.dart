import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/admin/admin_patient_body.dart';
import 'package:mytal/data/model/response/admin/admin_patient_model.dart';
import 'package:mytal/data/model/response/centre_model.dart';
import 'package:mytal/data/model/response/ethnic_model.dart';
import 'package:mytal/data/model/response/sex_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class AdminAddPatientDialog extends StatefulWidget {
  final AdminPatientModel? patient;
  final Function? onSave;
  const AdminAddPatientDialog({Key? key, this.patient, this.onSave}) : super(key: key);

  @override
  State<AdminAddPatientDialog> createState() => _AdminAddPatientDialogState();
}

class _AdminAddPatientDialogState extends State<AdminAddPatientDialog> {
  final TextEditingController _registrationController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _centreController = TextEditingController();
  final TextEditingController _ethnicController = TextEditingController();
  final TextEditingController _icController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  bool _isDeleting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.patient != null) {
      _nameController.text = widget.patient!.name;
      _dobController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.patient!.dob));
      _registrationController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.patient!.dateRegistration));
      _sexController.text = widget.patient!.sexDescr;
      _centreController.text = widget.patient!.centreId.toString();
      _ethnicController.text = widget.patient!.ethnicId.toString();
      _icController.text = widget.patient!.nric.toString();
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
                "${widget.patient != null ? 'Edit' : 'Add'} Patient",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: Dimensions.paddingSizeSmall),
                      TextFormField(
                        controller: _registrationController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Registration Date",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            _registrationController.text = formattedDate;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the registration date.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the patient's name.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      Consumer(builder: (context, ref, _) {
                        final centres = ref.watch(centreListProvider);
                        return centres.when(
                          loading: () => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Centre'),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(value: widget.patient?.centreDescr ?? "", label: widget.patient?.centreDescr ?? ""),
                            ],
                            initialSelection: widget.patient?.centreDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Centre'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) => DropdownMenu<String>(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Centre'),
                            initialSelection: _centreController.text,
                            onSelected: (centre) {
                              setState(() {
                                _centreController.text = centre.toString();
                              });
                            },
                            dropdownMenuEntries: data.map(
                              (CentreModel centre) {
                                return DropdownMenuEntry<String>(
                                  value: centre.id.toString(),
                                  label: centre.centreName,
                                );
                              },
                            ).toList(),
                          ),
                        );
                      }),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      Consumer(builder: (context, ref, _) {
                        final sexes = ref.watch(sexListProvider);
                        return sexes.when(
                          loading: () => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Sex'),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(value: widget.patient?.sexDescr ?? "", label: widget.patient?.sexDescr ?? ""),
                            ],
                            initialSelection: widget.patient?.sexDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Sex'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) {
                            return DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width - 110,
                              label: const Text('Sex'),
                              onSelected: (sex) {
                                setState(() {
                                  _sexController.text = sex.toString();
                                });
                              },
                              initialSelection: _sexController.text,
                              dropdownMenuEntries: data.map(
                                (SexModel sex) {
                                  return DropdownMenuEntry<String>(
                                    value: sex.id.toString(),
                                    label: sex.sexDescr,
                                  );
                                },
                              ).toList(),
                            );
                          },
                        );
                      }),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      Consumer(builder: (context, ref, _) {
                        final ethnicities = ref.watch(ethnicListProvider);
                        return ethnicities.when(
                          loading: () => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Ethnicity'),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(value: widget.patient?.ethnicDescr ?? "", label: widget.patient?.ethnicDescr ?? ""),
                            ],
                            initialSelection: widget.patient?.ethnicDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Ethnicity'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) => DropdownMenu<String>(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Ethnicity'),
                            onSelected: (ethnic) {
                              setState(() {
                                _ethnicController.text = ethnic.toString();
                              });
                            },
                            initialSelection: _ethnicController.text,
                            dropdownMenuEntries: data.map(
                              (EthnicModel ethnic) {
                                return DropdownMenuEntry<String>(
                                  value: ethnic.id.toString(),
                                  label: ethnic.ethnicDescr,
                                );
                              },
                            ).toList(),
                          ),
                        );
                      }),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _dobController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Date of Birth",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: widget.patient != null ? DateTime.parse(widget.patient!.dob) : DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            _dobController.text = formattedDate;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Date of Birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _icController,
                        keyboardType: TextInputType.number,
                        // inputFormatters: [maskFormatter],
                        decoration: const InputDecoration(
                          labelText: 'NRIC',
                          border: OutlineInputBorder(),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter patient\'s IC';
                        //   }
                        //   return null;
                        // },
                      ),
                      if (_errorMessage != null) ErrorBox(error: _errorMessage!),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Row(
                children: [
                  Consumer(builder: (context, ref, _) {
                    return Column(
                      children: [
                        widget.patient != null
                            ? TextButton(
                                onPressed: () {
                                  // Confirm delete
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder: (context, setState) {
                                        return AlertDialog(
                                          title: const Text('Confirm Delete'),
                                          content: const Text('Are you sure you want to delete this ferritin?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (_isDeleting == true) return;

                                                setState(() {
                                                  _isDeleting = true;
                                                });

                                                try {
                                                  // await GetIt.I.get<ApiClient>().deleteFerritin(widget.ferritin!.id);
                                                  // ref.invalidate(ferritinProvider);
                                                  // if (widget.onSave != null) {
                                                  //   widget.onSave!();
                                                  // }
                                                  // if (context.mounted) {
                                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                                  //     const SnackBar(content: Text('Deleted Ferritin')),
                                                  //   );

                                                  //   Navigator.pop(context);
                                                  //   Navigator.pop(context);
                                                  // }
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
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                  );
                                },
                                child: const Text('Delete'),
                              )
                            : const SizedBox(),
                      ],
                    );
                  }),
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
                  Consumer(
                    builder: (context, ref, _) {
                      return SaveButton(
                        loading: _isSubmitting,
                        onPressed: () async {
                          if (_sexController.text.isEmpty) {
                            setState(() {
                              _errorMessage = "Sex not selected.";
                            });
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isSubmitting = true;
                            });
                            try {
                              if (widget.patient != null) {
                                // await GetIt.I.get<ApiClient>().editFerritin(
                                //       EditFerritinBody(
                                //         id: widget.ferritin!.id,
                                //         dateMeasured: DateTime.parse(_dateController.text)
                                //             .copyWith(hour: DateTime.now().hour, minute: DateTime.now().minute, second: DateTime.now().second)
                                //             .toIso8601String(),
                                //         level: double.parse(_levelController.text),
                                //       ),
                                //     );

                                if (widget.onSave != null) {
                                  widget.onSave!();
                                }

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Patient Updated')),
                                  );
                                }
                              } else {
                                AdminPatientBody patient = AdminPatientBody(
                                  name: _nameController.text,
                                  dob: _dobController.text,
                                  sexId: _sexController.text.isNotEmpty ? int.parse(_sexController.text) : null,
                                  ethnicId: _ethnicController.text.isNotEmpty ? int.parse(_ethnicController.text) : null,
                                  centreId: _centreController.text.isNotEmpty ? int.parse(_centreController.text) : null,
                                  nric: _icController.text,
                                  dateRegistration: _registrationController.text,
                                );

                                await GetIt.I.get<ApiClient>().adminAddPatient(patient);

                                if (widget.onSave != null) {
                                  widget.onSave!();
                                }

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Patient Created')),
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
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
