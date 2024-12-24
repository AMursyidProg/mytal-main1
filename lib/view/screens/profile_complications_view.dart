import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/model/response/complication_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/complications_card.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/loading_card.dart';

class ProfileComplicationsView extends ConsumerWidget {
  final bool isDoctor;
  final AsyncValue<List<ComplicationModel>> complicationHepB;
  final AsyncValue<List<ComplicationModel>> complicationHepC;
  final AsyncValue<List<ComplicationModel>> complicationHiv;
  final AsyncValue<List<ComplicationModel>> complicationOthers;
  final Function? onRefresh;
  final Function? onComplicationHepBSave;
  final Function? onComplicationHepCSave;
  final Function? onComplicationHivSave;
  final Function? onComplicationOthersSave;
  final int? patientId;

  const ProfileComplicationsView({
    Key? key,
    required this.complicationHepB,
    required this.complicationHepC,
    required this.complicationHiv,
    required this.complicationOthers,
    this.onRefresh,
    this.onComplicationHepBSave,
    this.onComplicationHepCSave,
    this.onComplicationHivSave,
    this.onComplicationOthersSave,
    this.isDoctor = false,
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
              complicationHepB.when(
                loading: () => const CardPlaceholder(
                  title: "Hepatitis B",
                  widget: TableShimmer(
                    headers: ["Test", "Result", "Test Date"],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: "Hepatitis B",
                  widget: ErrorBox(error: err.toString()),
                ),
                data: (data) => ComplicationsCard(
                  title: "Hepatitis B",
                  complications: data,
                  isRefreshing: complicationHepB.isRefreshing,
                  onSave: () => onComplicationHepBSave?.call(),
                  patientId: patientId,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              complicationHepC.when(
                loading: () => const CardPlaceholder(
                  title: "Hepatitis C",
                  widget: TableShimmer(
                    headers: ["Test", "Result", "Test Date"],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: "Test C",
                  widget: ErrorBox(error: err.toString()),
                ),
                data: (data) => ComplicationsCard(
                  title: "Hepatitis C",
                  complications: data,
                  isRefreshing: complicationHepC.isRefreshing,
                  onSave: () => onComplicationHepCSave?.call(),
                  patientId: patientId,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              complicationHiv.when(
                loading: () => const CardPlaceholder(
                  title: "HIV",
                  widget: TableShimmer(
                    headers: ["Test", "Result", "Test Date"],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: "HIV",
                  widget: ErrorBox(error: err.toString()),
                ),
                data: (data) => ComplicationsCard(
                  title: "HIV",
                  complications: data,
                  isRefreshing: complicationHiv.isRefreshing,
                  onSave: () => onComplicationHivSave?.call(),
                  patientId: patientId,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              complicationOthers.when(
                loading: () => const CardPlaceholder(
                  title: "Others",
                  widget: TableShimmer(
                    headers: ["Test", "Result", "Test Date"],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: "Others",
                  widget: ErrorBox(error: err.toString()),
                ),
                data: (data) => ComplicationsCard(
                  title: "Others",
                  complications: data,
                  isRefreshing: complicationOthers.isRefreshing,
                  onSave: () => onComplicationOthersSave?.call(),
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
