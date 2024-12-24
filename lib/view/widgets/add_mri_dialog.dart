import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/mri_body.dart';
import 'package:mytal/data/model/response/lic_severity_model.dart';
import 'package:mytal/data/model/response/mic_severity_model.dart';
import 'package:mytal/data/model/response/mri_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class AddMriDialog extends StatefulWidget {
  final MriModel? mri;
  final Function? onSave;
  final int? patientId;
  const AddMriDialog({
    Key? key,
    this.mri,
    this.onSave,
    this.patientId,
  }) : super(key: key);

  @override
  State<AddMriDialog> createState() => _AddMriDialog();
}

class _AddMriDialog extends State<AddMriDialog> {
  final TextEditingController _dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _micSeverityController =
      TextEditingController(text: "0");
  final TextEditingController _micController = TextEditingController();
  final TextEditingController _licSeverityController =
      TextEditingController(text: "0");
  final TextEditingController _licController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  //bool _isDeleting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.mri != null) {
      _dateController.text =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.mri!.dateMri));
      _micSeverityController.text = widget.mri!.micSeverityId.toString();
      _micController.text = widget.mri!.mic.toString();
      _licSeverityController.text = widget.mri!.licSeverityId.toString();
      _licController.text = widget.mri!.lic.toString();
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
                "${widget.mri != null ? 'Edit' : 'Add'} MRI T2*",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeLarge,
                    color: Theme.of(context).primaryColor),
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
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
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
                      /*Consumer(builder: (context, ref, _) 
                      {
                        final severity = ref.watch(micSeverityProvider);
                        return severity.when(
                          loading: () => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('MIC Severity'),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(
                                  value: widget.mri?.micSeverityDescr ?? "",
                                  label: widget.mri?.micSeverityDescr ?? ""),
                            ],
                            initialSelection:
                                widget.mri?.micSeverityDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('MIC Severity'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) {
                            return DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width - 110,
                              label: const Text('MIC Severity'),
                              onSelected: (severity) {
                                setState(() {
                                  _micSeverityController.text =
                                      severity.toString();
                                });
                              },
                              initialSelection: _micSeverityController.text,
                              dropdownMenuEntries: data.map(
                                (MicSeverityModel severity) {
                                  return DropdownMenuEntry<String>(
                                    value: severity.id.toString(),
                                    label: severity.severityDescr,
                                  );
                                },
                              ).toList(),
                            );
                          },
                        );
                      }),*/
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _micController,
                        decoration: const InputDecoration(
                          labelText: 'MIC value (ms)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the MIC value.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      /* Consumer(builder: (context, ref, _) {
                        final severity = ref.watch(licSeverityProvider);
                        return severity.when(
                          loading: () => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('LIC Severity'),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(
                                  value: widget.mri?.licSeverityDescr ?? "",
                                  label: widget.mri?.licSeverityDescr ?? ""),
                            ],
                            initialSelection:
                                widget.mri?.licSeverityDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('LIC Severity'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) {
                            return DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width - 110,
                              label: const Text('LIC Severity'),
                              onSelected: (severity) {
                                setState(() {
                                  _licSeverityController.text =
                                      severity.toString();
                                });
                              },
                              initialSelection: _licSeverityController.text,
                              dropdownMenuEntries: data.map(
                                (LicSeverityModel severity) {
                                  return DropdownMenuEntry<String>(
                                    value: severity.id.toString(),
                                    label: severity.severityDescr,
                                  );
                                },
                              ).toList(),
                            );
                          },
                        );
                      }),*/
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _licController,
                        decoration: const InputDecoration(
                          labelText: 'LIC value (ms)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the LIC value.';
                          }
                          return null;
                        },
                      ),
                      if (_errorMessage != null)
                        ErrorBox(error: _errorMessage!),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Row(
                children: [
                  // Column(
                  //   children: [
                  //     widget.chelation == null
                  //         ? const SizedBox()
                  //         : TextButton(
                  //             onPressed: () {
                  //               // Confirm delete
                  //               showDialog(
                  //                 context: context,
                  //                 builder: (context) {
                  //                   return StatefulBuilder(builder: (context, setState) {
                  //                     return AlertDialog(
                  //                       title: const Text('Confirm Delete'),
                  //                       content: const Text('Are you sure you want to delete this chelation?'),
                  //                       actions: [
                  //                         TextButton(
                  //                           onPressed: () {
                  //                             Navigator.pop(context);
                  //                           },
                  //                           child: const Text('Cancel'),
                  //                         ),
                  //                         ElevatedButton(
                  //                           onPressed: () async {
                  //                             if (_isDeleting == true) return;

                  //                             setState(() {
                  //                               _isDeleting = true;
                  //                             });

                  //                             try {
                  //                               await GetIt.I.get<ApiClient>().deleteChelation(widget.chelation!.id);
                  //                               widget.onSave?.call();

                  //                               if (context.mounted) {
                  //                                 ScaffoldMessenger.of(context).showSnackBar(
                  //                                   const SnackBar(content: Text('Deleted Chelation')),
                  //                                 );

                  //                                 Navigator.pop(context);
                  //                                 Navigator.pop(context);
                  //                               }
                  //                             } catch (e, s) {
                  //                               if (context.mounted) {
                  //                                 ScaffoldMessenger.of(context).showSnackBar(
                  //                                   SnackBar(
                  //                                     content: Text(e.toString() + s.toString()),
                  //                                   ),
                  //                                 );
                  //                               }
                  //                             }
                  //                             setState(() {
                  //                               _isDeleting = false;
                  //                             });
                  //                           },
                  //                           child: _isDeleting == true
                  //                               ? SizedBox(
                  //                                   height: 20,
                  //                                   width: 20,
                  //                                   child: CircularProgressIndicator(
                  //                                     strokeWidth: 2,
                  //                                     color: Theme.of(context).primaryColor,
                  //                                   ),
                  //                                 )
                  //                               : const Text("Delete"),
                  //                         ),
                  //                       ],
                  //                     );
                  //                   });
                  //                 },
                  //               );
                  //             },
                  //             child: const Text('Delete')),
                  //   ],
                  // ),
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
                    return SaveButton(
                      loading: _isSubmitting,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isSubmitting = true;
                          });
                          try {
                            if (widget.mri != null) {
                              await GetIt.I.get<ApiClient>().editMri(
                                    EditMriBody(
                                      id: widget.mri!.id,
                                      dateMri:
                                          DateTime.parse(_dateController.text)
                                              .toIso8601String(),
                                      micSeverityId: int.parse(
                                          _micSeverityController.text),
                                      mic: double.parse(_micController.text),
                                      licSeverityId: int.parse(
                                          _licSeverityController.text),
                                      lic: double.parse(_licController.text),
                                    ),
                                    widget.patientId,
                                  );

                              widget.onSave?.call();

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Updated MRI')),
                                );
                              }
                            } else {
                              // if (_chelationTypeController.text.isEmpty) {
                              //   final chelationTypes = ref.watch(chelationTypeListProvider);
                              //   _chelationTypeController.text = chelationTypes.value!.first.id.toString();
                              // }
                              debugPrint(_micSeverityController.text);
                              await GetIt.I.get<ApiClient>().addMri(
                                    AddMriBody(
                                      dateMri:
                                          DateTime.parse(_dateController.text)
                                              .toIso8601String(),
                                      micSeverityId: int.parse(
                                          _micSeverityController.text),
                                      mic: double.parse(_micController.text),
                                      licSeverityId: int.parse(
                                          _licSeverityController.text),
                                      lic: double.parse(_licController.text),
                                    ),
                                    widget.patientId,
                                  );

                              widget.onSave?.call();

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added MRI')),
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
