import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/complication_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/edit_complications_dialog.dart';

class ComplicationsCard extends StatelessWidget {
  final List<ComplicationModel> complications;
  final String title;
  final Function? onSave;
  final bool isRefreshing;
  final int? patientId;

  const ComplicationsCard({
    super.key,
    required this.complications,
    required this.title,
    this.onSave,
    this.isRefreshing = false,
    this.patientId,
  });

  void _onRowTap(BuildContext context, ComplicationModel complication) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EditComplicationsDialog(
          complication: complication,
          onSave: onSave,
          patientId: patientId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
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
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Table(
              border: TableBorder(
                horizontalInside: BorderSide(width: 1, color: AppColors.color(context, 100), style: BorderStyle.solid),
              ),
              children: [
                TableRow(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Text('Test', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Text('Result', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Text('Test Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                  decoration: BoxDecoration(color: AppColors.color(context, 50)),
                ),
                ...complications.map((complication) => getComplicationRow(context, complication)).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }

  TableRow getComplicationRow(BuildContext context, ComplicationModel data) {
    return TableRow(
      children: [
        TableRowInkWell(
          onTap: () => _onRowTap(context, data),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: data.complicationStatusDescr == "Positive" || data.complicationStatusDescr == "Reactive"
                ? Text(data.complicationTypeDescr, style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold))
                : Text(data.complicationTypeDescr),
          ),
        ),
        TableRowInkWell(
          onTap: () => _onRowTap(context, data),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: data.complicationStatusDescr == "Positive" || data.complicationStatusDescr == "Reactive"
                ? Text(data.complicationStatusDescr, style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold))
                : Text(data.complicationStatusDescr),
          ),
        ),
        TableRowInkWell(
          onTap: () => _onRowTap(context, data),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: data.dateComplication != null
                ? data.complicationStatusDescr == "Positive" || data.complicationStatusDescr == "Reactive"
                    ? Text(
                        DateFormat('d MMM y').format(
                          DateTime.parse(data.dateComplication!),
                        ),
                        style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold))
                    : Text(
                        DateFormat('d MMM y').format(
                          DateTime.parse(data.dateComplication!),
                        ),
                      )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
