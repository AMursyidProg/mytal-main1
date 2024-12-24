import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/laboratory_body.dart';
import 'package:mytal/data/model/response/laboratory_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/save_button.dart';

class EditHbAnalysisDialog extends StatefulWidget {
  final LaboratoryModel laboratory;
  final Function? onSave;
  final int? patientId;

  const EditHbAnalysisDialog({required this.laboratory, this.onSave, this.patientId, super.key});

  @override
  State<EditHbAnalysisDialog> createState() => _EditHbAnalysisDialog();
}

class _EditHbAnalysisDialog extends State<EditHbAnalysisDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController hbAController;
  late TextEditingController hbA2Controller;
  late TextEditingController hbFController;
  late TextEditingController hbEController;
  late TextEditingController hbHController;
  late TextEditingController hbOthersController;
  String? _errorMessage;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    hbAController = TextEditingController(text: widget.laboratory.hbA != null ? widget.laboratory.hbA.toString() : '');
    hbA2Controller = TextEditingController(text: widget.laboratory.hbA2 != null ? widget.laboratory.hbA2.toString() : '');
    hbFController = TextEditingController(text: widget.laboratory.hbF != null ? widget.laboratory.hbF.toString() : '');
    hbEController = TextEditingController(text: widget.laboratory.hbE != null ? widget.laboratory.hbE.toString() : '');
    hbHController = TextEditingController(text: widget.laboratory.hbH != null ? widget.laboratory.hbH.toString() : '');
    hbOthersController = TextEditingController(text: widget.laboratory.hbOthers != null ? widget.laboratory.hbOthers.toString() : '');
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
                'Update Hb Analysis',
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
                        controller: hbAController,
                        decoration: const InputDecoration(
                          labelText: 'HbA',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: hbA2Controller,
                        decoration: const InputDecoration(
                          labelText: 'HbA2',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: hbFController,
                        decoration: const InputDecoration(
                          labelText: 'HbF',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: hbEController,
                        decoration: const InputDecoration(
                          labelText: 'HbE',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: hbHController,
                        decoration: const InputDecoration(
                          labelText: 'HbH',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      TextFormField(
                        controller: hbOthersController,
                        decoration: const InputDecoration(
                          labelText: 'Others',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                  SaveButton(
                    loading: _isSubmitting,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isSubmitting = true;
                        });

                        try {
                          await GetIt.I.get<ApiClient>().editLaboratory(
                                EditLaboratoryBody(
                                  hbA: hbAController.text.isEmpty ? null : double.parse(hbAController.text),
                                  hbA2: hbA2Controller.text.isEmpty ? null : double.parse(hbA2Controller.text),
                                  hbF: hbFController.text.isEmpty ? null : double.parse(hbFController.text),
                                  hbE: hbEController.text.isEmpty ? null : double.parse(hbEController.text),
                                  hbH: hbHController.text.isEmpty ? null : double.parse(hbHController.text),
                                  hbOthers: hbOthersController.text.isEmpty ? null : double.parse(hbOthersController.text),
                                  patientId: widget.patientId,
                                ),
                                widget.patientId,
                              );

                          widget.onSave?.call();
                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Hb Analysis Updated')),
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
          ),
        ),
      ),
    );
  }
}
