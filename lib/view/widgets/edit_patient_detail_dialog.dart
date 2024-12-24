import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/patient_detail_body.dart';
import 'package:mytal/data/model/response/centre_model.dart';
import 'package:mytal/data/model/response/ethnic_model.dart';
import 'package:mytal/data/model/response/patient_detail_model.dart';
import 'package:mytal/data/model/response/sex_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/save_button.dart';

// var maskFormatter = MaskTextInputFormatter(mask: '######-##-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

class EditPatientDetailDialog extends StatefulWidget {
  final PatientDetailModel patient;
  final Function? onSave;
  final int? patientId;
  const EditPatientDetailDialog({required this.patient, this.onSave, this.patientId, super.key});

  @override
  State<EditPatientDetailDialog> createState() => _EditPatientDetailDialogState();
}

class _EditPatientDetailDialogState extends State<EditPatientDetailDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController icController;
  late TextEditingController sexController;
  late TextEditingController ethnicController;
  late TextEditingController centreController;
  String? _errorMessage;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.patient.name);
    dobController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.patient.dob)));
    icController = TextEditingController(text: widget.patient.nric);
    sexController = TextEditingController(text: widget.patient.sexId.toString());
    ethnicController = TextEditingController(text: widget.patient.ethnicId.toString());
    centreController = TextEditingController(text: widget.patient.centreId.toString());
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
                'Update Profile',
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
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
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
                              DropdownMenuEntry<String>(value: widget.patient.centreDescr ?? "", label: widget.patient.centreDescr ?? ""),
                            ],
                            initialSelection: widget.patient.centreDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Centre'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) => DropdownMenu<String>(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Centre'),
                            initialSelection: centreController.text,
                            onSelected: (centre) {
                              setState(() {
                                centreController.text = centre.toString();
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
                              DropdownMenuEntry<String>(value: widget.patient.sexDescr ?? "", label: widget.patient.sexDescr ?? ""),
                            ],
                            initialSelection: widget.patient.sexDescr ?? "",
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
                                  sexController.text = sex.toString();
                                });
                              },
                              initialSelection: sexController.text,
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
                              DropdownMenuEntry<String>(value: widget.patient.ethnicDescr ?? "", label: widget.patient.ethnicDescr ?? ""),
                            ],
                            initialSelection: widget.patient.ethnicDescr ?? "",
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
                                ethnicController.text = ethnic.toString();
                              });
                            },
                            initialSelection: ethnicController.text,
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
                        controller: dobController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Date of Birth",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.parse(widget.patient.dob), firstDate: DateTime(1900), lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            dobController.text = formattedDate;
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
                        controller: icController,
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
                      if (_errorMessage != null)
                        Text(
                          _errorMessage!,
                          style: TextStyle(color: Theme.of(context).colorScheme.error),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          if (_formKey.currentState!.validate()) {
                            EditPatientDetailBody updatedPatient = EditPatientDetailBody(
                              name: nameController.text,
                              dob: dobController.text,
                              sexId: int.parse(sexController.text),
                              ethnicId: int.parse(ethnicController.text),
                              centreId: int.parse(centreController.text),
                              nric: icController.text,
                              dateRegistration: widget.patient.dateRegistration,
                            );

                            setState(() {
                              _isSubmitting = true;
                            });

                            try {
                              await GetIt.I.get<ApiClient>().editPatientDetails(updatedPatient, widget.patientId);
                              if (widget.onSave != null) {
                                widget.onSave!();
                              }
                              if (context.mounted) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Profile Updated')),
                                );
                              }
                            } catch (e, s) {
                              _errorMessage = e.toString() + s.toString();
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
