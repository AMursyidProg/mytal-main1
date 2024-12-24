import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/growth_chart_model.dart';
import 'package:mytal/data/model/response/height_weight_chart_model.dart';
import 'package:mytal/data/model/response/height_weight_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/height_weight_table_screen.dart';
import 'package:mytal/view/widgets/add_height_weight_dialog.dart';

class HeightCard extends StatefulWidget {
  final List<HeightWeightModel> heights;
  final List<HeightWeightChartModel> chartData;
  final List<GrowthChartModel> growthChartData;
  final MetaDataResponse? metaData;
  final bool isDoctor;
  final bool isRefreshing;
  final Function? onSave;
  final int? patientId;

  const HeightCard({
    super.key,
    required this.heights,
    required this.chartData,
    required this.growthChartData,
    this.metaData,
    required this.isRefreshing,
    this.onSave,
    this.isDoctor = false,
    this.patientId,
  });

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  final TextEditingController dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController heightController = TextEditingController();

  void _onRowTap(BuildContext context, HeightWeightModel heightWeight) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddHeightWeightDialog(
          patientId: widget.patientId,
          heightWeight: heightWeight,
          onSave: widget.onSave,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = widget.isDoctor
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Height',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                ),
                widget.isRefreshing
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
                        return AddHeightWeightDialog(
                          patientId: widget.patientId,
                          onSave: widget.onSave,
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraSmall),
              // width: chartData.length * 25,
              child: LineChart(
                LineChartData(
                  backgroundColor: AppColors.color(context, 800),
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.chartData.where((data) => data.height != null).toList().asMap().entries.map((entry) {
                        HeightWeightChartModel val = entry.value;
                        // int idx = val.age!;
                        // int idx = DateTime.parse(entry.value.measuredDate!).millisecondsSinceEpoch;
                        return FlSpot(val.age!, val.height!.toDouble());
                      }).toList(),
                      isCurved: true,
                      color: AppColors.color(context, 200),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: gradientColors,
                      ),
                    ),
                    LineChartBarData(
                      spots: widget.growthChartData.map((val) {
                        return FlSpot(val.ageYear, val.height3);
                      }).toList(),
                      isCurved: true,
                      color: Colors.grey,
                      barWidth: 1,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                    LineChartBarData(
                      spots: widget.growthChartData.map((val) {
                        return FlSpot(val.ageYear, val.height50);
                      }).toList(),
                      isCurved: true,
                      color: Colors.grey[300],
                      barWidth: 1,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                    LineChartBarData(
                      spots: widget.growthChartData.map((val) {
                        return FlSpot(val.ageYear, val.height97);
                      }).toList(),
                      isCurved: true,
                      color: Colors.grey,
                      barWidth: 1,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      axisNameWidget: const Text("Height", style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold)),
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
                                  const TextSpan(text: ' cm', style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    // rightTitles: AxisTitles(
                    //   sideTitles: SideTitles(
                    //     reservedSize: 60,
                    //     showTitles: true,
                    //     getTitlesWidget: (value, meta) {
                    //       if (value == meta.max || value == meta.min) {
                    //         return const SizedBox();
                    //       }
                    //       return SideTitleWidget(
                    //         axisSide: meta.axisSide,
                    //         child: RichText(
                    //           text: TextSpan(
                    //             style: const TextStyle(
                    //               color: Colors.black,
                    //               fontSize: Dimensions.fontSizeExtraSmall,
                    //             ),
                    //             children: <TextSpan>[
                    //               TextSpan(text: meta.formattedValue),
                    //               const TextSpan(text: ' cm', style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall)),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: const Text(
                        "Age (Years)",
                        style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold),
                      ),
                      axisNameSize: 20,
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value == meta.max || value == meta.min) {
                            return const SizedBox();
                          }

                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeExtraSmall,
                              ),
                            ),
                          );
                        },
                        // getTitlesWidget: Dates.getChartDates,
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
                                    child: Text('Height', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                                decoration: BoxDecoration(color: AppColors.color(context, 50)),
                              ),
                              ...widget.heights.map(
                                (height) {
                                  return TableRow(
                                    children: [
                                      TableRowInkWell(
                                        onTap: () => _onRowTap(context, height),
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          child: Text(DateFormat('d MMM y').format(DateTime.parse(height.measuredDate))),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () => _onRowTap(context, height),
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          child: Text('${height.height.toString()} cm'),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ).toList(),
                            ],
                          ),
                          widget.isRefreshing
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
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HeightWeightTable(
                          patientId: widget.patientId,
                          onSave: widget.onSave,
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
          ),
        ],
      ),
    );
  }
}
