import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/height_weight_model.dart';
import 'package:mytal/data/model/response/patient_detail_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dates.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/edit_patient_detail_dialog.dart';
import 'package:mytal/view/widgets/height_card.dart';
import 'package:mytal/view/widgets/loading_card.dart';
import 'package:mytal/view/widgets/weight_card.dart';

class ProfileDetailsView extends ConsumerWidget {
  final AsyncValue<PatientDetailModel> patientDetails;
  final AsyncValue<HeightWeightResponse> heightWeights;
  final Function? onRefresh;
  final Function? onPatientDetailSave;
  final Function? onHeightWeightSave;
  final int? patientId;
  const ProfileDetailsView({
    Key? key,
    required this.patientDetails,
    required this.heightWeights,
    this.onRefresh,
    this.onPatientDetailSave,
    this.onHeightWeightSave,
    this.patientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => onRefresh?.call(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                            child: patientDetails.when(
                              loading: () => const Row(
                                children: [
                                  TextShimmer(),
                                ],
                              ),
                              error: (_, __) => const SizedBox(),
                              data: (v) {
                                return Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      v.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                                    ),
                                    patientDetails.isRefreshing
                                        ? Container(
                                            margin: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                                            width: 15,
                                            height: 15,
                                            child: const CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ))
                                        : const SizedBox(),
                                    const Expanded(child: SizedBox()),
                                    TextButton.icon(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerLeft),
                                      onPressed: () {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return EditPatientDetailDialog(patient: v, patientId: patientId, onSave: onPatientDetailSave);
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.edit, size: 20),
                                      label: const Text(
                                        'Edit',
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                Dimensions.paddingSizeDefault, 0, Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppColors.color(context, 200),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(Icons.person, size: 40, color: AppColors.color(context, 50)),
                                ),
                                const SizedBox(width: Dimensions.paddingSizeDefault),
                                Expanded(
                                    child: patientDetails.when(
                                  loading: () => const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Centre: ',
                                            style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.bold),
                                          ),
                                          TextShimmer(),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Row(
                                        children: [
                                          Text(
                                            'Sex: ',
                                            style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.bold),
                                          ),
                                          TextShimmer(),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Row(
                                        children: [
                                          Text(
                                            'Ethnicity: ',
                                            style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.bold),
                                          ),
                                          TextShimmer(),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Row(
                                        children: [
                                          Text(
                                            'DOB: ',
                                            style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.bold),
                                          ),
                                          TextShimmer(width: 50),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Row(
                                        children: [
                                          Text(
                                            'NRIC: ',
                                            style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.bold),
                                          ),
                                          TextShimmer(width: 50),
                                        ],
                                      ),
                                    ],
                                  ),
                                  error: (err, stack) => Text(err.toString()),
                                  data: (v) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          style: const TextStyle(
                                            fontSize: Dimensions.fontSizeSmall,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            const TextSpan(text: "Centre: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: v.centreDescr ?? ""),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Text.rich(
                                        TextSpan(
                                          style: const TextStyle(
                                            fontSize: Dimensions.fontSizeSmall,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            const TextSpan(text: "Sex: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: v.sexDescr ?? ""),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Text.rich(
                                        TextSpan(
                                          style: const TextStyle(
                                            fontSize: Dimensions.fontSizeSmall,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            const TextSpan(text: "Ethnicity: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: v.ethnicDescr ?? ""),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Text.rich(
                                        TextSpan(
                                          style: const TextStyle(
                                            fontSize: Dimensions.fontSizeSmall,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            const TextSpan(text: "DOB: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(
                                                text: '${DateFormat('d MMM y').format(DateTime.parse(v.dob))} (Age: ${Dates.calculateAge(
                                              DateTime.parse(v.dob),
                                            )})'),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                      Text.rich(
                                        TextSpan(
                                          style: const TextStyle(
                                            fontSize: Dimensions.fontSizeSmall,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            const TextSpan(text: "NRIC: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: v.nric ?? ""),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    heightWeights.when(
                      loading: () => const ChartShimmer(title: "Height", xText: "Age (Years)", yText: "Height"),
                      error: (err, stack) => ChartShimmer(title: "Height", error: err.toString()),
                      data: (v) => HeightCard(
                        heights: v.heightWeight,
                        chartData: v.heightWeightChart!,
                        growthChartData: v.growthChart!,
                        metaData: v.metaData,
                        isRefreshing: heightWeights.isRefreshing,
                        onSave: onHeightWeightSave,
                        patientId: patientId,
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    heightWeights.when(
                      loading: () => const ChartShimmer(title: "Weight", xText: "Age (Years)", yText: "Weight"),
                      error: (err, stack) => ChartShimmer(title: "Weight", error: err.toString()),
                      data: (v) => WeightCard(
                        weights: v.heightWeight,
                        chartData: v.heightWeightChart!,
                        growthChartData: v.growthChart!,
                        metaData: v.metaData,
                        isRefreshing: heightWeights.isRefreshing,
                        onSave: onHeightWeightSave,
                        patientId: patientId,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
