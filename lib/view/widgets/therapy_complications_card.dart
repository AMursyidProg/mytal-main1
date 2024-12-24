import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/model/response/therapy_complications_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/profile_complications_update_view.dart';

class TherapyComplicationsCard extends StatelessWidget {
  final List<TherapyComplicationsModel> complications;
  final AsyncValue<List<TherapyComplicationsModel>> allTherapyComplications;
  final String title;
  final bool isRefreshing;
  final int? patientId;
  final Function? onSave;
  

  const TherapyComplicationsCard({
    super.key,
    required this.complications,
    required this.allTherapyComplications,
    required this.title,
    this.patientId,
    this.isRefreshing = false,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    void onEditTap() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What are your symptoms?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeLarge),
                  Expanded(
                    child: ProfileComplicationsUpdateView(
                      patientId: patientId,
                      allTherapyComplications: allTherapyComplications,
                      onSave: onSave,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                ),
                isRefreshing
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
                  onPressed: onEditTap,
                  icon: const Icon(Icons.edit, size: 20),
                  label: const Text(
                    'Edit',
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            complications.isNotEmpty
                ? Wrap(
                    spacing: Dimensions.paddingSizeSmall,
                    children: complications.map((complication) {
                      return FilterChip(
                        shape: StadiumBorder(side: BorderSide(width: 0, color: Theme.of(context).primaryColor)),
                        backgroundColor: AppColors.color(context, 100),
                        selectedColor: AppColors.color(context, 800),
                        checkmarkColor: Colors.white,
                        labelStyle: TextStyle(
                          color: complication.selected ? Colors.white : Colors.black,
                        ),
                        label: Text(complication.therapyComplicationDescr, style: const TextStyle(fontSize: Dimensions.fontSizeSmall)),
                        selected: complication.selected,
                        onSelected: (bool selected) {
                          onEditTap();
                        },
                      );
                    }).toList(),
                  )
                : const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Text("No complications"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
