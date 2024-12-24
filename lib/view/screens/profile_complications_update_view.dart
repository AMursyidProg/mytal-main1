import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/therapy_complications_body.dart';
import 'package:mytal/data/model/response/therapy_complications_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';
import 'package:intl/intl.dart';

class ProfileComplicationsUpdateView extends ConsumerStatefulWidget {
  final AsyncValue<List<TherapyComplicationsModel>> allTherapyComplications;
  final Function? onSave;
  final int? patientId;
  const ProfileComplicationsUpdateView(
      {Key? key,
      required this.allTherapyComplications,
      this.onSave,
      this.patientId})
      : super(key: key);

  @override
  ProfileComplicationsUpdateViewState createState() =>
      ProfileComplicationsUpdateViewState();
}

class ProfileComplicationsUpdateViewState
    extends ConsumerState<ProfileComplicationsUpdateView> {
  Set<TherapyComplicationsModel> selectedComplications =
      <TherapyComplicationsModel>{};
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool _isSubmitting = false;
  bool isSubmitted = false;
  DateTime dt = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  String formattedDate = "0";

  @override
  void initState() {
    super.initState();
    final complications = widget.patientId != null
        ? ref.read(
            adminAllTherapyComplicationsProvider(widget.patientId.toString()))
        : ref.read(allTherapyComplicationsProvider);
    complications.asData?.value.forEach((complication) {
      if (complication.selected) {
        selectedComplications.add(complication);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.allTherapyComplications.when(
        loading: () => Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        error: (err, stack) => ErrorBox(error: "$err\n$stack"),
        data: (data) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                color: AppColors.color(context, 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_errorMessage != null)
                            ErrorBox(error: _errorMessage!),
                          const Text("Current symptoms:",
                              style: TextStyle(
                                  fontSize: Dimensions.fontSizeExtraSmall)),
                          const SizedBox(height: 2),
                          selectedComplications.isNotEmpty
                              ? Text(
                                  selectedComplications
                                      .map((e) => e.therapyComplicationDescr)
                                      .join(', '),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeSmall,
                                  ),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        Dimensions.paddingSizeSmall),
                                    child: Text("No symptoms"),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      const Text("Desferrioxamine:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: Dimensions.paddingSizeSmall,
                        // filter data to show only desferrioxamine

                        children: data
                            .where((complication) =>
                                complication.therapyComplicationTypeID == 1)
                            .map((complication) {
                          return FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).primaryColor)),
                            backgroundColor: AppColors.color(context, 100),
                            selectedColor: AppColors.color(context, 800),
                            checkmarkColor: Colors.white,
                            labelStyle: TextStyle(
                              color:
                                  selectedComplications.contains(complication)
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            label: Text(complication.therapyComplicationDescr,
                                style: const TextStyle(
                                    fontSize: Dimensions.fontSizeSmall)),
                            selected:
                                selectedComplications.contains(complication),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedComplications.add(complication);
                                } else {
                                  selectedComplications.remove(complication);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      const Text("Deferiprone:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: Dimensions.paddingSizeSmall,
                        // filter data to show only desferrioxamine

                        children: data
                            .where((complication) =>
                                complication.therapyComplicationTypeID == 2)
                            .map((complication) {
                          return FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).primaryColor)),
                            backgroundColor: AppColors.color(context, 100),
                            selectedColor: AppColors.color(context, 800),
                            checkmarkColor: Colors.white,
                            labelStyle: TextStyle(
                              color:
                                  selectedComplications.contains(complication)
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            label: Text(complication.therapyComplicationDescr,
                                style: const TextStyle(
                                    fontSize: Dimensions.fontSizeSmall)),
                            selected:
                                selectedComplications.contains(complication),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedComplications.add(complication);
                                } else {
                                  selectedComplications.remove(complication);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      const Text("Deferasirox:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: Dimensions.paddingSizeSmall,
                        // filter data to show only desferrioxamine

                        children: data
                            .where((complication) =>
                                complication.therapyComplicationTypeID == 3)
                            .map((complication) {
                          return FilterChip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).primaryColor)),
                            backgroundColor: AppColors.color(context, 100),
                            selectedColor: AppColors.color(context, 800),
                            checkmarkColor: Colors.white,
                            labelStyle: TextStyle(
                              color:
                                  selectedComplications.contains(complication)
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            label: Text(complication.therapyComplicationDescr,
                                style: const TextStyle(
                                    fontSize: Dimensions.fontSizeSmall)),
                            selected:
                                selectedComplications.contains(complication),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedComplications.add(complication);
                                } else {
                                  selectedComplications.remove(complication);
                                }
                              });
                            },
                          );
                        }).toList(),
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
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
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
                          List<EditTherapyComplicationsBody>
                              updatedComplications = [];
                          // loop through complications and update selected status
                          for (var complication in data) {
                            updatedComplications
                                .add(EditTherapyComplicationsBody(
                              id: complication.id,
                              selected:
                                  selectedComplications.contains(complication),
                              therapyComplicationDescr:
                                  complication.therapyComplicationDescr,
                              therapyComplicationTypeID:
                                  complication.therapyComplicationTypeID,
                              therapyComplicationTypeDescr:
                                  complication.therapyComplicationTypeDescr,
                              //dateComplication: (formattedDate)),
                            ));
                          }

                          await GetIt.I
                              .get<ApiClient>()
                              .editTherapyComplications(
                                  updatedComplications, widget.patientId);

                          widget.onSave?.call();

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Therapy Complications Updated')),
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
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
