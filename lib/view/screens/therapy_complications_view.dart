import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/model/response/therapy_complications_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/loading_card.dart';
import 'package:mytal/view/widgets/therapy_complications_card.dart';

const String titleDesferrioxamine = "Desferrioxamine Complications";
const String titleDeferiprone = "Deferiprone Complications";
const String titleDesferasirox = "Desferasirox Complications";

class TherapyComplicationsView extends StatelessWidget {
  final AsyncValue<List<TherapyComplicationsModel>> therapyComplications;
  final AsyncValue<List<TherapyComplicationsModel>> allTherapyComplications;
  final Function? onRefresh;
  final Function? onSave;
  final int? patientId;

  const TherapyComplicationsView({
    Key? key,
    required this.therapyComplications,
    required this.allTherapyComplications,
    this.onRefresh,
    this.onSave,
    this.patientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh?.call(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              therapyComplications.when(
                loading: () => const CardPlaceholder(
                  title: titleDesferrioxamine,
                  widget: Row(
                    children: [
                      TextShimmer(width: 50),
                    ],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: titleDesferrioxamine,
                  widget: ErrorBox(error: "$err\n$stack"),
                ),
                data: (data) => TherapyComplicationsCard(
                  title: titleDesferrioxamine,
                  complications: data.where((element) => element.therapyComplicationTypeID == 1).toList(),
                  isRefreshing: therapyComplications.isRefreshing,
                  allTherapyComplications: allTherapyComplications,
                  patientId: patientId,
                  onSave: onSave,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              therapyComplications.when(
                loading: () => const CardPlaceholder(
                  title: titleDeferiprone,
                  widget: Row(
                    children: [
                      TextShimmer(width: 50),
                    ],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: titleDeferiprone,
                  widget: ErrorBox(error: "$err\n$stack"),
                ),
                data: (data) => TherapyComplicationsCard(
                  title: titleDeferiprone,
                  complications: data.where((element) => element.therapyComplicationTypeID == 2).toList(),
                  isRefreshing: therapyComplications.isRefreshing,
                  allTherapyComplications: allTherapyComplications,
                  patientId: patientId,
                  onSave: onSave,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              therapyComplications.when(
                loading: () => const CardPlaceholder(
                  title: titleDesferasirox,
                  widget: Row(
                    children: [
                      TextShimmer(width: 50),
                    ],
                  ),
                ),
                error: (err, stack) => CardPlaceholder(
                  title: titleDesferasirox,
                  widget: ErrorBox(error: "$err\n$stack"),
                ),
                data: (data) => TherapyComplicationsCard(
                  title: titleDesferasirox,
                  complications: data.where((element) => element.therapyComplicationTypeID == 3).toList(),
                  isRefreshing: therapyComplications.isRefreshing,
                  allTherapyComplications: allTherapyComplications,
                  patientId: patientId,
                  onSave: onSave,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
