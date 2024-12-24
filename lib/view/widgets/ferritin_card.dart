import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/ferritin_chart_model.dart';
import 'package:mytal/data/model/response/ferritin_model.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dates.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/ferritin_table_screen.dart';
import 'package:mytal/view/widgets/add_ferritin_dialog.dart';

class FerritinCard extends StatelessWidget {
  final List<FerritinModel> ferritins;
  final List<FerritinChartModel> chartData;
  final MetaDataResponse? metaData;
  final bool isDoctor;
  final bool isRefreshing;
  final Function? onSave;
  final int? patientId;

  const FerritinCard({
    super.key,
    required this.ferritins,
    required this.chartData,
    required this.isRefreshing,
    this.metaData,
    this.onSave,
    this.patientId,
    this.isDoctor = false,
  });

  void _onRowTap(BuildContext context, FerritinModel ferritin) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddFerritinDialog(
          patientId: patientId,
          ferritin: ferritin,
          onSave: onSave,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ferritins.sort((a, b) => DateTime.parse(a.dateMeasured!).compareTo(DateTime.parse(b.dateMeasured!)));

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
              children: [
                const Text(
                  'Serum Ferritin',
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
                        return AddFerritinDialog(
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
                width: ferritins.length * 50,
                child: LineChart(
                  LineChartData(
                    backgroundColor: AppColors.color(context, 800),
                    lineBarsData: [
                      LineChartBarData(
                        spots: chartData.asMap().entries.map((entry) {
                          FerritinChartModel val = entry.value;
                          int idx = DateTime.parse(entry.value.dateMeasured).millisecondsSinceEpoch;
                          return FlSpot(idx.toDouble(), val.level.toDouble());
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
                    ],
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        axisNameWidget:
                            const Text("Ferritin Level", style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold)),
                        sideTitles: SideTitles(
                          reservedSize: 60,
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
                                    const TextSpan(text: ' ug/L', style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        axisNameWidget:
                            const Text("Ferritin Level", style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold)),
                        sideTitles: SideTitles(
                          reservedSize: 60,
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
                                    const TextSpan(text: ' ug/L', style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall)),
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
                                    child: Text('Ferritin Level', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                                decoration: BoxDecoration(color: AppColors.color(context, 50)),
                              ),
                              ...ferritins.map(
                                (ferritin) {
                                  return TableRow(
                                    children: [
                                      TableRowInkWell(
                                        onTap: () => _onRowTap(context, ferritin),
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          child: Text(DateFormat('d MMM y').format(DateTime.parse(ferritin.dateMeasured))),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () => _onRowTap(context, ferritin),
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          child: Text('${ferritin.level.toString()} ug/L'),
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
                            builder: (context) => FerritinTable(
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
