import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/error_box.dart';
import 'package:mytal/view/widgets/loading_card.dart';
import 'package:mytal/view/widgets/pie_chart_widget.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<StatefulWidget> createState() => ReportViewState();
}

class ReportViewState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final sexReport = ref.watch(sexReportProvider);
      final ethnicReport = ref.watch(ethnicReportProvider);
      final diagnosisReport = ref.watch(diagnosisReportProvider);
      return RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(ethnicReportProvider);
          ref.invalidate(diagnosisReportProvider);
          return ref.refresh(sexReportProvider.future);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Patients by Sex',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                            ),
                            sexReport.isRefreshing
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
                        sexReport.when(
                          loading: () => const PieChartShimmer(),
                          error: (err, stack) => ErrorBox(error: err.toString()),
                          data: (data) {
                            return PieChartWidget(
                              dualColumn: true,
                              data: data
                                  .where((v) => v.quantity > 0)
                                  .map((v) => PieChartModel(value: v.quantity.toDouble(), label: v.description))
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Patients by Ethnicity',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                            ),
                            ethnicReport.isRefreshing
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
                        ethnicReport.when(
                          loading: () => const PieChartShimmer(),
                          error: (err, stack) => ErrorBox(error: err.toString()),
                          data: (data) {
                            return PieChartWidget(
                              dualColumn: true,
                              data: data
                                  .where((v) => v.quantity > 0)
                                  .map((v) => PieChartModel(value: v.quantity.toDouble(), label: v.description))
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Patients by Diagnosis',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
                            ),
                            diagnosisReport.isRefreshing
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
                        diagnosisReport.when(
                          loading: () => const PieChartShimmer(),
                          error: (err, stack) => ErrorBox(error: err.toString()),
                          data: (data) {
                            return PieChartWidget(
                              data: data
                                  .where((v) => v.quantity > 0)
                                  .map((v) => PieChartModel(value: v.quantity.toDouble(), label: v.description))
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

final List<Color> gradientColors = [
  Colors.blue[500]!,
  Colors.cyan[300]!,
];

BarChartGroupData makeBarChartGroupData(int x, double y) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        color: Colors.teal[200]!,
        gradient: LinearGradient(
          colors: gradientColors.map((color) => color).toList(),
        ),
        width: 15,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      ),
    ],
  );
}
