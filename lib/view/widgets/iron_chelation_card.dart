import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/chelation_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/add_chelation_dialog.dart';

class IronChelationCard extends StatelessWidget {
  final List<ChelationModel> chelations;
  final MetaDataResponse? metaData;
  final bool isRefreshing;
  final Function? onSave;
  final int? patientId;

  const IronChelationCard({
    super.key,
    required this.chelations,
    this.metaData,
    required this.isRefreshing,
    this.onSave,
    this.patientId,
  });

  void _onRowTap(BuildContext context, ChelationModel chelation) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddChelationDialog(
          patientId: patientId,
          chelation: chelation,
          onSave: onSave,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  'Iron Chelation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
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
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AddChelationDialog(
                          patientId: patientId,
                          onSave: onSave,
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text(
                    'Add',
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Container(
              alignment: Alignment.center,
              child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(100.0),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(100.0),
                  },
                  border: TableBorder(
                    horizontalInside: BorderSide(width: 1, color: AppColors.color(context, 100), style: BorderStyle.solid),
                  ),
                  children: [
                    TableRow(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Text('Date Started', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Text('Chelation', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Text('Dosage', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                      decoration: BoxDecoration(color: AppColors.color(context, 50)),
                    ),
                    ...chelations.map(
                      (chelation) {
                        return TableRow(
                          children: [
                            TableRowInkWell(
                              onTap: () => _onRowTap(context, chelation),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: Text(DateFormat('d MMM y').format(DateTime.parse(chelation.dateStarted))),
                              ),
                            ),
                            TableRowInkWell(
                              onTap: () => _onRowTap(context, chelation),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: Text(chelation.chelationTypeDescr),
                              ),
                            ),
                            TableRowInkWell(
                              onTap: () => _onRowTap(context, chelation),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: Text(chelation.dosage?.toString() ?? ""),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
