import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/diagnosis_model.dart';
import 'package:mytal/data/model/response/laboratory_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/edit_hb_analysis_dialog.dart';
import 'package:mytal/view/widgets/loading_card.dart';

class ProfileClinicalView extends ConsumerWidget {
  final AsyncValue<LaboratoryModel> laboratory;
  final AsyncValue<DiagnosisModel> diagnosis;
  final Function? onSave;
  final Function? onRefresh;
  final int? patientId;
  const ProfileClinicalView({
    Key? key,
    required this.laboratory,
    required this.diagnosis,
    this.onSave,
    this.onRefresh,
    this.patientId,
  }) : super(key: key);

  void _onAnalysisTap(BuildContext context, LaboratoryModel data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EditHbAnalysisDialog(laboratory: data, onSave: onSave, patientId: patientId);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => onRefresh?.call(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      diagnosis.when(
                        loading: () => const Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text('Diagnosis'),
                                ),
                                TextShimmer(),
                              ],
                            ),
                            SizedBox(height: Dimensions.paddingSizeSmall),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Date Diagnosed',
                                  ),
                                ),
                                TextShimmer(),
                              ],
                            ),
                            SizedBox(height: Dimensions.paddingSizeSmall),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text('Basis for Diagnosis'),
                                ),
                                TextShimmer(),
                              ],
                            ),
                          ],
                        ),
                        error: (err, stack) => const SizedBox(),
                        data: (data) => Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text('Diagnosis'),
                                ),
                                Expanded(
                                  child: Text(data.diagnosisDescr, style: const TextStyle(fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Date Diagnosed',
                                  ),
                                ),
                                Expanded(
                                  child: Text(DateFormat('d MMM y').format(DateTime.parse(data.dateDiagnosed)),
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text('Basis for Diagnosis'),
                                ),
                                Expanded(
                                  child: Text(data.lab == true ? "Laboratory" : "Clinical", style: const TextStyle(fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Hb Analysis',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                          ),
                          laboratory.isRefreshing
                              ? Container(
                                  margin: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                                  width: 15,
                                  height: 15,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ))
                              : const SizedBox(),
                          const Expanded(child: SizedBox()),
                          laboratory.when(
                            loading: () => const SizedBox(),
                            error: (err, stack) => const SizedBox(),
                            data: (data) => TextButton.icon(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () => _onAnalysisTap(context, data),
                              icon: const Icon(Icons.edit, size: 18),
                              label: const Text(
                                'Edit',
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      laboratory.when(
                        loading: () => GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 1.5,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          mainAxisSpacing: Dimensions.paddingSizeSmall,
                          crossAxisSpacing: Dimensions.paddingSizeSmall,
                          children: const [
                            HbCard(
                              text: "HbA",
                              isLoading: true,
                            ),
                            HbCard(
                              text: "HbA2",
                              isLoading: true,
                            ),
                            HbCard(
                              text: "HbF",
                              isLoading: true,
                            ),
                            HbCard(
                              text: "HbE",
                              isLoading: true,
                            ),
                            HbCard(
                              text: "HbH",
                              isLoading: true,
                            ),
                            HbCard(
                              text: "Others",
                              isLoading: true,
                            ),
                          ],
                        ),
                        error: (err, stack) => Text(err.toString()),
                        data: (v) => GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 1.5,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          mainAxisSpacing: Dimensions.paddingSizeSmall,
                          crossAxisSpacing: Dimensions.paddingSizeSmall,
                          children: [
                            InkWell(
                              onTap: () => _onAnalysisTap(context, v),
                              child: HbCard(
                                value: v.hbA,
                                text: "HbA",
                              ),
                            ),
                            InkWell(
                              onTap: () => _onAnalysisTap(context, v),
                              child: HbCard(
                                value: v.hbA2,
                                text: "HbA2",
                              ),
                            ),
                            InkWell(
                              onTap: () => _onAnalysisTap(context, v),
                              child: HbCard(
                                value: v.hbF,
                                text: "HbF",
                              ),
                            ),
                            InkWell(
                              onTap: () => _onAnalysisTap(context, v),
                              child: HbCard(
                                value: v.hbE,
                                text: "HbE",
                              ),
                            ),
                            InkWell(
                              onTap: () => _onAnalysisTap(context, v),
                              child: HbCard(
                                value: v.hbH,
                                text: "HbH",
                              ),
                            ),
                            InkWell(
                              onTap: () => _onAnalysisTap(context, v),
                              child: HbCard(
                                value: v.hbOthers,
                                text: "Others",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HbCard extends StatelessWidget {
  final String text;
  final double? value;
  final bool isLoading;
  const HbCard({super.key, required this.text, this.value, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    int shade = 50;
    double analysis = value ?? 0;

    if (analysis >= 30) {
      shade = 300;
    } else if (analysis >= 20) {
      shade = 200;
    } else if (analysis > 0) {
      shade = 100;
    }

    return Container(
      color: AppColors.color(context, shade),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextShimmer(),
                    SizedBox(width: 5),
                    Text("%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge)),
                  ],
                )
              : Text('${analysis.toStringAsFixed(2)}%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge)),
          Text(text, style: const TextStyle(fontSize: Dimensions.fontSizeSmall)),
        ],
      ),
    );
  }
}
