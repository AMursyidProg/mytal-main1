import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/mri_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/add_mri_dialog.dart';

class MriCard extends StatelessWidget {
  final List<MriModel> mris;
  final MetaDataResponse? metaData;
  final bool isRefreshing;
  final Function? onSave;
  final int? patientId;

  const MriCard({
    super.key,
    required this.mris,
    this.metaData,
    required this.isRefreshing,
    this.onSave,
    this.patientId,
  });

  void _onRowTap(BuildContext context, MriModel mri) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddMriDialog(
          patientId: patientId,
          mri: mri,
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
                  'MRI T2*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeLarge),
                ),
                isRefreshing
                    ? Container(
                        margin: const EdgeInsets.only(
                            left: Dimensions.paddingSizeDefault),
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
                        return AddMriDialog(
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
                // columnWidths: const {
                //   0: FlexColumnWidth(),
                //   1: FlexColumnWidth(),
                //   2: FlexColumnWidth(),
                // },
                border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1,
                      color: AppColors.color(context, 100),
                      style: BorderStyle.solid),
                ),
                children: [
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Text('Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Text('Severity',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Text('Value',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                    decoration:
                        BoxDecoration(color: AppColors.color(context, 50)),
                  ),
                  ...mris.map(
                    (mri) {
                      return TableRow(
                        children: [
                          TableRowInkWell(
                            onTap: () => _onRowTap(context, mri),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  Dimensions.paddingSizeSmall),
                              child: Text(DateFormat('d MMM y')
                                  .format(DateTime.parse(mri.dateMri))),
                            ),
                          ),
                          TableRowInkWell(
                            onTap: () => _onRowTap(context, mri),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  Dimensions.paddingSizeSmall),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: 'MIC: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: mri.micSeverityDescr ?? "N/A",
                                            style: mri.micSeverityDescr ==
                                                    'Severe'
                                                ? TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red[800])
                                                : null),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeExtraSmall),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: 'LIC: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: mri.licSeverityDescr ?? "N/A",
                                            style: mri.licSeverityDescr ==
                                                    'Severe'
                                                ? TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red[800])
                                                : null),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TableRowInkWell(
                            onTap: () => _onRowTap(context, mri),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  Dimensions.paddingSizeSmall),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: 'MIC: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '${mri.mic.toString()} ms',
                                            style: mri.micSeverityDescr ==
                                                    'Severe'
                                                ? TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red[800])
                                                : null),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeExtraSmall),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: 'LIC: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '${mri.lic.toString()} ms',
                                            style: mri.licSeverityDescr ==
                                                    'Severe'
                                                ? TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red[800])
                                                : null),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
