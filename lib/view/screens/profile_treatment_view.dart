import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/model/response/chelation_model.dart';
import 'package:mytal/data/model/response/ferritin_model.dart';
import 'package:mytal/data/model/response/mri_model.dart';
import 'package:mytal/data/model/response/transfusion_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/ferritin_card.dart';
import 'package:mytal/view/widgets/iron_chelation_card.dart';
import 'package:mytal/view/widgets/loading_card.dart';
import 'package:mytal/view/widgets/mri_card.dart';
import 'package:mytal/view/widgets/transfusion_card.dart';

class ProfileTreatmentView extends ConsumerWidget {
  final AsyncValue<List<TransfusionModel>> transfusions;
  final AsyncValue<FerritinResponse> ferritins;
  final AsyncValue<ChelationResponse> chelations;
  final AsyncValue<MriResponse> mris;
  final Function? onRefresh;
  final Function? onTransfusionSave;
  final Function? onFerritinSave;
  final Function? onChelationSave;
  final Function? onMriSave;
  final int? patientId;
  const ProfileTreatmentView({
    Key? key,
    required this.transfusions,
    required this.ferritins,
    required this.chelations,
    required this.mris,
    this.onRefresh,
    this.onTransfusionSave,
    this.onFerritinSave,
    this.onChelationSave,
    this.onMriSave,
    this.patientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => onRefresh?.call(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              transfusions.when(
                loading: () => const ChartShimmer(
                    title: "Blood Transfusion", yText: "Volume"),
                error: (err, stack) => ChartShimmer(
                    title: "Blood Transfusion", error: "$err\n$stack"),
                data: (v) => TransfusionCard(
                  transfusions: v,
                  isRefreshing: transfusions.isRefreshing,
                  onSave: onTransfusionSave,
                  patientId: patientId,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              ferritins.when(
                loading: () => const ChartShimmer(
                    title: "Serum Ferritin", yText: "Ferritin Level"),
                error: (err, stack) => ChartShimmer(
                    title: "Serum Ferritin", error: err.toString()),
                data: (v) => FerritinCard(
                  ferritins: v.ferritin,
                  chartData: v.ferritinChart!,
                  metaData: v.metaData,
                  isRefreshing: ferritins.isRefreshing,
                  onSave: onFerritinSave,
                  patientId: patientId,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              chelations.when(
                loading: () => const CardPlaceholder(
                  title: "Iron Chelation",
                  widget: TableShimmer(
                    headers: ["Date Started", "Chelation", "Dosage"],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: "Iron Chelation",
                  widget: ErrorBox(error: err.toString()),
                ),
                data: (v) => IronChelationCard(
                  chelations: v.chelation,
                  metaData: v.metaData,
                  isRefreshing: chelations.isRefreshing,
                  onSave: onChelationSave,
                  patientId: patientId,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              mris.when(
                loading: () => const CardPlaceholder(
                  title: "MRI",
                  widget: TableShimmer(
                    headers: ["Date", "Severity", "Value"],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: "MRI T2*",
                  widget: ErrorBox(error: err.toString()),
                ),
                data: (v) => MriCard(
                  mris: v.mri,
                  metaData: v.metaData,
                  isRefreshing: mris.isRefreshing,
                  onSave: onMriSave,
                  patientId: patientId,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
