import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/transfusion_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dates.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/transfusion_table_screen.dart';
import 'package:mytal/view/widgets/add_transfusion_dialog.dart';

class TransfusionCard extends StatelessWidget {
  final List<TransfusionModel> transfusions;
  final bool isDoctor;
  final bool isRefreshing;
  final Function? onSave;
  final int? patientId;

  const TransfusionCard({
    super.key,
    required this.transfusions,
    required this.isRefreshing,
    this.onSave,
    this.patientId,
    this.isDoctor = false,
  });

  void _onRowTap(BuildContext context, TransfusionModel transfusion) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddTransfusionDialog(
          patientId: patientId,
          transfusion: transfusion,
          onSave: onSave,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = isDoctor
        ? [
            Colors.blue[500]!,
            Colors.cyan[300]!,
          ]
        : [
            Colors.yellow[500]!,
            Colors.orange[400]!,
          ];
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Blood Transfusion',
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
                    if (isDoctor) {
                      return;
                    }
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AddTransfusionDialog(
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
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          AspectRatio(
            aspectRatio: 1.3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraSmall),
                width: transfusions.length * 65,
                child: BarChart(
                  BarChartData(
                    backgroundColor: AppColors.color(context, 800),
                    barGroups: transfusions.reversed.toList().asMap().entries.map((entry) {
                      TransfusionModel val = entry.value;
                      int idx = DateTime.parse(entry.value.dateTransfusion).millisecondsSinceEpoch;
                      return BarChartGroupData(
                        x: idx,
                        barRods: [
                          BarChartRodData(
                            toY: val.volume.toDouble(),
                            color: AppColors.color(context, 200),
                            gradient: LinearGradient(
                              colors: gradientColors.map((color) => color).toList(),
                            ),
                            width: 15,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                          ),
                        ],
                      );
                    }).toList(),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        axisNameWidget: const Text("Volume", style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold)),
                        sideTitles: SideTitles(
                          reservedSize: 50,
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == meta.max || value == meta.min) {
                              return const SizedBox();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: meta.formattedValue),
                                    const TextSpan(text: ' ml', style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        axisNameWidget: const Text("Volume", style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold)),
                        sideTitles: SideTitles(
                          reservedSize: 50,
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == meta.max || value == meta.min) {
                              return const SizedBox();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: meta.formattedValue),
                                    const TextSpan(text: ' ml', style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: const AxisTitles(
                        axisNameWidget: Text("Date Measured", style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold)),
                        axisNameSize: 20,
                        sideTitles: SideTitles(
                          reservedSize: 30,
                          showTitles: true,
                          getTitlesWidget: Dates.getChartDates,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0, Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault),
            child: ExpansionTile(
              shape: const Border(),
              title: const Text(
                'Details',
                style: TextStyle(fontSize: Dimensions.fontSizeDefault),
              ),
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Stack(
                        children: [
                          Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(width: 1, color: AppColors.color(context, 100), style: BorderStyle.solid),
                            ),
                            children: [
                              TableRow(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                                    child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                                    child: Text('Volume', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                                decoration: BoxDecoration(color: AppColors.color(context, 50)),
                              ),
                              ...transfusions.map(
                                (transfusion) {
                                  return TableRow(
                                    children: [
                                      TableRowInkWell(
                                        onTap: () => _onRowTap(context, transfusion),
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          child: Text(DateFormat('d MMM y').format(DateTime.parse(transfusion.dateTransfusion))),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () => _onRowTap(context, transfusion),
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          child: Text('${transfusion.volume.toString()} ml'),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ],
                          ),
                          isRefreshing
                              ? Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Container(
                                      margin: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                                      width: 15,
                                      height: 15,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransfusionTable(
                              patientId: patientId,
                              onSave: onSave,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
