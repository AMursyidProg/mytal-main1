import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/complication_body.dart';
import 'package:mytal/data/model/response/complication_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class EditComplicationsDialog extends StatefulWidget {
  final ComplicationModel complication;
  final Function? onSave;
  final int? patientId;

  const EditComplicationsDialog({required this.complication, this.onSave, this.patientId, super.key});

  @override
  State<EditComplicationsDialog> createState() => _EditComplicationsDialog();
}

class ComplicationResult {
  final String label;
  final int value;

  ComplicationResult(this.label, this.value);
}

// type 1
List<ComplicationResult> resultsYes = [
  ComplicationResult('Yes', 1),
  ComplicationResult('No', 2),
  ComplicationResult('Unknown', 3),
];

// type 2
List<ComplicationResult> resultsPositive = [
  ComplicationResult('Positive', 8),
  ComplicationResult('Negative', 9),
  ComplicationResult('Not done', 10),
  ComplicationResult('Unknown', 11),
];

// type 3
List<ComplicationResult> resultsReactive = [
  ComplicationResult('Reactive', 4),
  ComplicationResult('Non-reactive', 5),
  ComplicationResult('Not done', 6),
  ComplicationResult('Unknown', 7),
];

Map<int, int> resultMappings = {
  1: 3,
  2: 2,
  3: 3,
  4: 1,
  5: 2,
  6: 3,
  7: 1,
  8: 1,
  9: 1,
  10: 1,
  11: 1,
  12: 1,
  13: 1,
};

class _EditComplicationsDialog extends State<EditComplicationsDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _testController;
  late TextEditingController _resultController;
  late TextEditingController _dateController;
  late List<ComplicationResult> _resultsDropdown;
  late int _selectedResult;
  late int _complicationStatusTypeId;

  String? _errorMessage;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _testController = TextEditingController(text: widget.complication.complicationTypeDescr);
    _resultController = TextEditingController(text: widget.complication.complicationStatusDescr);

    switch (resultMappings[widget.complication.complicationTypeId]) {
      case 1:
        _resultsDropdown = resultsYes;
        _complicationStatusTypeId = 1;
        break;
      case 2:
        _resultsDropdown = resultsPositive;
        _complicationStatusTypeId = 2;
        break;
      case 3:
        _resultsDropdown = resultsReactive;
        _complicationStatusTypeId = 3;
        break;
      default:
        _resultsDropdown = resultsYes;
        _complicationStatusTypeId = 1;
    }
    _selectedResult = widget.complication.complicationStatusId;
    _dateController = TextEditingController(
        text: widget.complication.dateComplication != null
            ? DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.complication.dateComplication!))
            : '');
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
                'Update Test',
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
                        controller: _testController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Test',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      DropdownMenu<String>(
                        controller: _resultController,
                        width: MediaQuery.of(context).size.width - 110,
                        initialSelection: widget.complication.complicationStatusId.toString(),
                        label: Text("Test Result (${widget.complication.complicationStatusDescr})"),
                        dropdownMenuEntries: _resultsDropdown.map((e) {
                          return DropdownMenuEntry(value: e.value.toString(), label: e.label);
                        }).toList(),
                        onSelected: (value) => setState(() => _selectedResult = int.parse(value!)),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Test Date",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate:
                                widget.complication.dateComplication != null ? DateTime.parse(widget.complication.dateComplication!) : DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            _dateController.text = formattedDate;
                          }
                        },
                      ),
                      if (_errorMessage != null) ErrorBox(error: _errorMessage!),
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
                            setState(() {
                              _isSubmitting = true;
                            });

                            try {
                              await GetIt.I.get<ApiClient>().editComplication(
                                    // EditComplicationBody(
                                    //   id: 14,
                                    //   complicationStatusId: 4,
                                    //   complicationStatusTypeId: 3,
                                    //   complicationTypeDescr: "Reactive",
                                    //   complicationTypeId: 1,
                                    //   dateComplication: "2021-07-19T09:31:00.000",
                                    // ),
                                    EditComplicationBody(
                                      id: widget.complication.id,
                                      complicationStatusId: _selectedResult,
                                      complicationStatusTypeId: _complicationStatusTypeId,
                                      complicationTypeDescr: _resultController.text,
                                      complicationTypeId: widget.complication.complicationTypeId,
                                      dateComplication: _dateController.text.isEmpty
                                          ? null
                                          : DateTime.parse(_dateController.text)
                                              .copyWith(hour: DateTime.now().hour, minute: DateTime.now().minute, second: DateTime.now().second)
                                              .toIso8601String(),
                                    ),
                                    widget.patientId,
                                  );

                              if (widget.onSave != null) {
                                widget.onSave!();
                              }

                              if (context.mounted) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Test Updated')),
                                );
                              }
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
