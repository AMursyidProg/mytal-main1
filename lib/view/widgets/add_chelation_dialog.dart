import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/chelation_body.dart';
import 'package:mytal/data/model/response/chelation_model.dart';
import 'package:mytal/data/model/response/chelation_type_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class AddChelationDialog extends StatefulWidget {
  final ChelationModel? chelation;
  final Function? onSave;
  final int? patientId;
  const AddChelationDialog({
    Key? key,
    this.chelation,
    this.onSave,
    this.patientId,
  }) : super(key: key);

  @override
  State<AddChelationDialog> createState() => _AddChelationDialog();
}

class _AddChelationDialog extends State<AddChelationDialog> {
  final TextEditingController _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _chelationTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  bool _isDeleting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.chelation != null) {
      _dosageController.text = widget.chelation!.dosage?.toString() ?? "";
      _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.chelation!.dateStarted));
      _chelationTypeController.text = widget.chelation!.chelationTypeId.toString();
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
                "${widget.chelation != null ? 'Edit' : 'Add'} Iron Chelation",
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
                          labelText: "Date Started",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
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
                      Consumer(builder: (context, ref, _) {
                        final chelationTypes = ref.watch(chelationTypeListProvider);
                        return chelationTypes.when(
                          loading: () => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Chelation Type'),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(
                                  value: widget.chelation?.chelationTypeDescr ?? "", label: widget.chelation?.chelationTypeDescr ?? ""),
                            ],
                            initialSelection: widget.chelation?.chelationTypeDescr ?? "",
                          ),
                          error: (err, stack) => DropdownMenu(
                            width: MediaQuery.of(context).size.width - 110,
                            label: const Text('Chelation Type'),
                            dropdownMenuEntries: const [],
                          ),
                          data: (data) {
                            return DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width - 110,
                              label: const Text('Chelation Type'),
                              onSelected: (chelationType) {
                                setState(() {
                                  _chelationTypeController.text = chelationType.toString();
                                });
                              },
                              initialSelection: _chelationTypeController.text.isNotEmpty ? _chelationTypeController.text : data.first.id.toString(),
                              dropdownMenuEntries: data.map(
                                (ChelationTypeModel chelationType) {
                                  return DropdownMenuEntry<String>(
                                    value: chelationType.id.toString(),
                                    label: chelationType.chelationTypeDescr,
                                  );
                                },
                              ).toList(),
                            );
                          },
                        );
                      }),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _dosageController,
                        decoration: const InputDecoration(
                          labelText: 'Dosage',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the dosage.';
                          }
                          return null;
                        },
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
                      widget.chelation == null
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
                                        content: const Text('Are you sure you want to delete this chelation?'),
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
                                                await GetIt.I.get<ApiClient>().deleteChelation(widget.chelation!.id);
                                                widget.onSave?.call();

                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('Deleted Chelation')),
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
                                          ),
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
                    return SaveButton(
                      loading: _isSubmitting,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isSubmitting = true;
                          });
                          try {
                            if (widget.chelation != null) {
                              await GetIt.I.get<ApiClient>().editChelation(
                                    EditChelationBody(
                                      id: widget.chelation!.id,
                                      dateStarted: DateTime.parse(_dateController.text).toIso8601String(),
                                      chelationTypeId: int.parse(_chelationTypeController.text),
                                      chelationTypeDescr: '', // To pass validation
                                      dosage: double.parse(_dosageController.text),
                                      patientId: widget.patientId,
                                    ),
                                    widget.patientId,
                                  );

                              widget.onSave?.call();

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Updated Chelation')),
                                );
                              }
                            } else {
                              debugPrint(_chelationTypeController.text);
                              if (_chelationTypeController.text.isEmpty) {
                                final chelationTypes = ref.watch(chelationTypeListProvider);
                                _chelationTypeController.text = chelationTypes.value!.first.id.toString();
                              }
                              await GetIt.I.get<ApiClient>().addChelation(
                                    AddChelationBody(
                                      dateStarted: DateTime.parse(_dateController.text)
                                          .copyWith(hour: DateTime.now().hour, minute: DateTime.now().minute, second: DateTime.now().second)
                                          .toIso8601String(),
                                      chelationTypeId: int.parse(_chelationTypeController.text),
                                      chelationTypeDescr: '', // To pass validation
                                      dosage: double.parse(_dosageController.text),
                                    ),
                                    widget.patientId,
                                  );

                              widget.onSave?.call();

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added Chelation')),
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
