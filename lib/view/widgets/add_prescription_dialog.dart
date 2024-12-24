import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/profile_prescription_model.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

const List<String> medications = <String>['Deferoxamine', 'Deferasirox', "Deferiprone"];
const List<String> deferoxamineIntervals = <String>['Daily', 'Every 2 days', 'Every 3 days', 'Weekly'];
const List<String> deferasiroxIntervals = <String>['Daily'];
const List<String> deferiproneIntervals = <String>['3 times a day', '2 times a day', 'Once a day'];

class AddPrescriptionDialog extends StatefulWidget {
  final ProfilePrescriptionModel? prescription;
  final Function? onSave;
  final int? patientId;
  const AddPrescriptionDialog({
    Key? key,
    this.prescription,
    this.onSave,
    this.patientId,
  }) : super(key: key);

  @override
  State<AddPrescriptionDialog> createState() => _AddPrescriptionDialog();
}

class _AddPrescriptionDialog extends State<AddPrescriptionDialog> {
  final TextEditingController _startDateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _intervalController = TextEditingController();
  final TextEditingController _totalDosesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  bool _isDeleting = false;
  String? _errorMessage;
  List<String> intervals = <String>[];

  @override
  void initState() {
    super.initState();
    if (widget.prescription != null) {
      _startDateController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.prescription!.startDate));
      _nameController.text = widget.prescription!.name;
      _intervalController.text = widget.prescription!.interval;
      _totalDosesController.text = widget.prescription!.totalDoses.toString();

      intervals = widget.prescription!.name == 'Deferoxamine'
          ? deferoxamineIntervals
          : widget.prescription!.name == 'Deferasirox'
              ? deferasiroxIntervals
              : deferiproneIntervals;
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
                "${widget.prescription != null ? 'Edit' : 'Add'} Prescription",
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
                        controller: _startDateController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Start Date",
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            _startDateController.text = formattedDate;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the start date.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      DropdownMenu(
                        width: MediaQuery.of(context).size.width - 110,
                        // initialSelection: ColorLabel.green,
                        controller: _nameController,
                        label: const Text('Medication'),
                        dropdownMenuEntries: medications.map((String value) {
                          return DropdownMenuEntry(value: value, label: value);
                        }).toList(),
                        onSelected: (String? medication) {
                          setState(() {
                            intervals = medication == 'Deferoxamine'
                                ? deferoxamineIntervals
                                : medication == 'Deferasirox'
                                    ? deferasiroxIntervals
                                    : deferiproneIntervals;

                            _intervalController.text = intervals[0];
                          });
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      DropdownMenu(
                        width: MediaQuery.of(context).size.width - 110,
                        // initialSelection: ColorLabel.green,
                        controller: _intervalController,
                        label: const Text('Interval'),
                        dropdownMenuEntries: intervals.map((String value) {
                          return DropdownMenuEntry(value: value, label: value);
                        }).toList(),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: _totalDosesController,
                        decoration: const InputDecoration(
                          labelText: 'Total Doses',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the number of doses.';
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
                      widget.prescription == null
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
                                        content: const Text('Are you sure you want to delete this prescription?'),
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

                                                  final List<ProfilePrescriptionModel> prescriptionList =
                                                      prefsState[AppConstants.profilePrescriptions];
                                                  prescriptionList.removeWhere((element) => element.id == widget.prescription!.id);
                                                  ref.read(prefsProvider.notifier).setList(AppConstants.profilePrescriptions, prescriptionList);

                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(content: Text('Deleted Prescription')),
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
                          if (_nameController.text.isEmpty) {
                            setState(() {
                              _errorMessage = 'Please enter the medication name.';
                            });
                            return;
                          }

                          if (_intervalController.text.isEmpty) {
                            setState(() {
                              _errorMessage = 'Please enter the interval.';
                            });
                            return;
                          }

                          setState(() {
                            _isSubmitting = true;
                          });
                          try {
                            DateTime date = DateTime.parse(_startDateController.text)
                                .copyWith(hour: DateTime.now().hour, minute: DateTime.now().minute, second: DateTime.now().second);
                            int prescriptionId = UniqueKey().hashCode;
                            ProfilePrescriptionModel prescription = ProfilePrescriptionModel(
                              id: prescriptionId,
                              startDate: date.toIso8601String(),
                              name: _nameController.text,
                              interval: _intervalController.text,
                              totalDoses: int.parse(_totalDosesController.text),
                              prescriptionEntries: [],
                            );

                            List<PrescriptionEntry> entries = [];

                            // Work out the prescription entries
                            DateTime currentDate = date;

                            for (int i = 0; i < prescription.totalDoses; i++) {
                              entries.add(PrescriptionEntry(
                                id: UniqueKey().hashCode,
                                prescriptionId: prescriptionId,
                                date: currentDate.copyWith(hour: 8, minute: 0, second: 0).toIso8601String(),
                                taken: false,
                              ));

                              if (prescription.interval == 'Daily') {
                                currentDate = currentDate.add(const Duration(days: 1));
                              } else if (prescription.interval == 'Every 2 days') {
                                currentDate = currentDate.add(const Duration(days: 2));
                              } else if (prescription.interval == 'Every 3 days') {
                                currentDate = currentDate.add(const Duration(days: 3));
                              } else if (prescription.interval == 'Weekly') {
                                currentDate = currentDate.add(const Duration(days: 7));
                              } else if (prescription.interval == '3 times a day') {
                                entries.add(PrescriptionEntry(
                                  id: UniqueKey().hashCode,
                                  prescriptionId: prescriptionId,
                                  date: currentDate.copyWith(hour: 12, minute: 0, second: 0).toIso8601String(),
                                  taken: false,
                                ));
                                entries.add(PrescriptionEntry(
                                  id: UniqueKey().hashCode,
                                  prescriptionId: prescriptionId,
                                  date: currentDate.copyWith(hour: 16, minute: 0, second: 0).toIso8601String(),
                                  taken: false,
                                ));
                                currentDate = currentDate.add(const Duration(days: 1));
                              } else if (prescription.interval == '2 times a day') {
                                entries.add(PrescriptionEntry(
                                  id: UniqueKey().hashCode,
                                  prescriptionId: prescriptionId,
                                  date: currentDate.copyWith(hour: 16, minute: 0, second: 0).toIso8601String(),
                                  taken: false,
                                ));
                                currentDate = currentDate.add(const Duration(days: 1));
                              } else if (prescription.interval == 'Once a day') {
                                currentDate = currentDate.add(const Duration(days: 1));
                              }
                            }

                            prescription = prescription.copyWith(prescriptionEntries: entries);
                            debugPrint("entries: $entries");

                            if (prefsState[AppConstants.profilePrescriptions] == null) {
                              final List<ProfilePrescriptionModel> prescriptionList = [];
                              ref.read(prefsProvider.notifier).setList(AppConstants.profilePrescriptions, prescriptionList);
                            }

                            if (widget.prescription != null) {
                              prescription = prescription.copyWith(id: widget.prescription!.id);
                              final List<ProfilePrescriptionModel> prescriptionList = prefsState[AppConstants.profilePrescriptions];
                              prescriptionList.removeWhere((element) => element.id == widget.prescription!.id);
                              prescriptionList.add(prescription);
                              prescriptionList.sort((a, b) => b.startDate.compareTo(a.startDate));

                              ref.read(prefsProvider.notifier).setList(AppConstants.profilePrescriptions, prescriptionList);

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Updated Prescription')),
                                );
                              }
                            } else {
                              final List<ProfilePrescriptionModel> prescriptionList = prefsState[AppConstants.profilePrescriptions];
                              prescriptionList.add(prescription);
                              prescriptionList.sort((a, b) => b.startDate.compareTo(a.startDate));
                              ref.read(prefsProvider.notifier).setList(AppConstants.profilePrescriptions, prescriptionList);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added Prescription')),
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
