import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/ferritin_body.dart';
import 'package:mytal/data/model/response/ferritin_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class AddFerritinDialog extends StatefulWidget {
  final FerritinModel? ferritin;
  final Function? onSave;
  final int? patientId;
  const AddFerritinDialog({
    Key? key,
    this.ferritin,
    this.onSave,
    this.patientId,
  }) : super(key: key);

  @override
  State<AddFerritinDialog> createState() => _AddFerritinDialogState();
}

class _AddFerritinDialogState extends State<AddFerritinDialog> {
  final TextEditingController _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _levelController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  bool _isDeleting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.ferritin != null) {
      _levelController.text = widget.ferritin!.level.toString();
      _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.ferritin!.dateMeasured));
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
                "${widget.ferritin != null ? 'Edit' : 'Add'} Serum Ferritin",
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
                      TextFormField(
                        controller: _levelController,
                        decoration: const InputDecoration(
                          labelText: 'Serum Ferritin (ug/L)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the measurement.';
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
                      widget.ferritin == null
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
                                                await GetIt.I.get<ApiClient>().deleteFerritin(widget.ferritin!.id);
                                                widget.onSave?.call();

                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('Deleted Ferritin')),
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
                  SaveButton(
                    loading: _isSubmitting,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isSubmitting = true;
                        });
                        try {
                          if (widget.ferritin != null) {
                            await GetIt.I.get<ApiClient>().editFerritin(
                                  EditFerritinBody(
                                    id: widget.ferritin!.id,
                                    dateMeasured: DateTime.parse(_dateController.text).toIso8601String(),
                                    level: double.parse(_levelController.text),
                                    patientId: widget.patientId,
                                  ),
                                  widget.patientId,
                                );

                            widget.onSave?.call();

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Updated Serum Ferritin')),
                              );
                            }
                          } else {
                            await GetIt.I.get<ApiClient>().addFerritin(
                                  AddFerritinBody(
                                    dateMeasured: DateTime.parse(_dateController.text)
                                        .copyWith(hour: DateTime.now().hour, minute: DateTime.now().minute, second: DateTime.now().second)
                                        .toIso8601String(),
                                    level: double.parse(_levelController.text),
                                  ),
                                  widget.patientId,
                                );

                            widget.onSave?.call();

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added Serum Ferritin')),
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
