import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mytal/util/dimensions.dart';

class PieChartWidget extends StatefulWidget {
  final List<PieChartModel> data;
  final bool dualColumn;
  const PieChartWidget({Key? key, required this.data, this.dualColumn = false}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  List colors = [
    Colors.orange[800],
    Colors.green[800],
    Colors.purple[800],
    Colors.red[800],
    Colors.teal[800],
    Colors.lime[800],
  ];

  List<Widget> getIndicators(List<PieChartModel> data) {
    return data.asMap().entries.map((entry) {
      int i = entry.key;

      final record = entry.value;
      final isTouched = i == touchedIndex;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
        child: Indicator(
          color: record.color ?? colors[i % colors.length],
          text: record.label,
          isTouched: isTouched,
          value: record.value,
        ),
      );
    }).toList();
  }

  List<PieChartSectionData> showingSections(List<PieChartModel> data) {
    return data.asMap().entries.map((entry) {
      int i = entry.key;
      final record = entry.value;
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? Dimensions.fontSizeLarge : Dimensions.fontSizeSmall;
      final radius = isTouched ? 100.0 : 80.0;
      var shadows = [const Shadow(color: Colors.black, blurRadius: 2)];

      Color textColor = Colors.white;
      if (touchedIndex > -1) {
        textColor = isTouched ? Colors.white : Colors.transparent;
        shadows = isTouched ? [const Shadow(color: Colors.black, blurRadius: 5)] : [];
      }
      return PieChartSectionData(
        color: record.color ?? colors[i % colors.length],
        value: record.value,
        title: "${record.label}\n${record.value.toInt()}",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
          shadows: shadows,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
              centerSpaceRadius: 20,
              sections: showingSections(widget.data),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        widget.dualColumn
            ? GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 6,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: getIndicators(widget.data),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getIndicators(widget.data),
              ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.value,
    this.size = 16,
    this.textColor,
    this.isTouched = false,
  });
  final Color color;
  final String text;
  final double value;
  final double size;
  final Color? textColor;
  final bool isTouched;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: Dimensions.paddingSizeExtraSmall,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: Dimensions.fontSizeDefault,
            fontWeight: FontWeight.bold,
            color: isTouched ? Colors.teal : textColor,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          value.toInt().toString(),
          style: TextStyle(
            fontSize: Dimensions.fontSizeDefault,
            color: isTouched ? Colors.teal : textColor,
          ),
        )
      ],
    );
  }
}

class PieChartModel {
  final double value;
  final String label;
  final Color? color;

  PieChartModel({
    required this.value,
    required this.label,
    this.color,
  });
}
