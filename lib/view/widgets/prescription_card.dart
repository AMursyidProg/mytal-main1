import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/profile_prescription_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/add_prescription_dialog.dart';

class PrescriptionCard extends StatelessWidget {
  final List<ProfilePrescriptionModel> prescriptions;
  const PrescriptionCard({
    super.key,
    required this.prescriptions,
  });

  void _onRowTap(BuildContext context, ProfilePrescriptionModel prescription) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddPrescriptionDialog(
          prescription: prescription,
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
                  'Prescriptions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                ),
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
                        return const AddPrescriptionDialog();
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
                          child: Text('Medication', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Text('Dosage', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                      decoration: BoxDecoration(color: AppColors.color(context, 50)),
                    ),
                    ...prescriptions.map(
                      (prescription) {
                        return TableRow(
                          children: [
                            TableRowInkWell(
                              onTap: () => _onRowTap(context, prescription),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: Text(DateFormat('d MMM y').format(DateTime.parse(prescription.startDate))),
                              ),
                            ),
                            TableRowInkWell(
                              onTap: () => _onRowTap(context, prescription),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: Text(prescription.name),
                              ),
                            ),
                            TableRowInkWell(
                              onTap: () => _onRowTap(context, prescription),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: Text('${prescription.interval} (${prescription.totalDoses} doses)'),
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
