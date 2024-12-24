import 'package:flutter/material.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  final String title;

  const LoadingCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
            const CircularProgressIndicator(),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          ],
        ),
      ),
    );
  }
}

class TextShimmer extends StatelessWidget {
  final double width;
  final double height;
  const TextShimmer({super.key, this.width = 20, this.height = 10});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.color(context, 100),
      highlightColor: AppColors.color(context, 50),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}

class TableShimmer extends StatelessWidget {
  final List<String> headers;
  const TableShimmer({super.key, required this.headers});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(width: 1, color: AppColors.color(context, 100), style: BorderStyle.solid),
      ),
      children: [
        // create table row of headers
        TableRow(
          children: headers
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: Text(e, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              )
              .toList(),
          decoration: BoxDecoration(color: AppColors.color(context, 50)),
        ),
        TableRow(
          children: headers
              .map(
                (e) => const Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: TextShimmer(),
                ),
              )
              .toList(),
          decoration: BoxDecoration(color: AppColors.color(context, 50)),
        ),
        TableRow(
          children: headers
              .map(
                (e) => const Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: TextShimmer(),
                ),
              )
              .toList(),
          decoration: BoxDecoration(color: AppColors.color(context, 50)),
        ),
      ],
    );
  }
}

class ChartShimmer extends StatelessWidget {
  final String title;
  final String? error;
  final String yText;
  final String xText;
  const ChartShimmer({super.key, required this.title, this.error, this.yText = "", this.xText = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            error != null
                ? Text(error!)
                : Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 65,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                yText,
                                style: const TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1.3,
                              child: Shimmer.fromColors(
                                baseColor: AppColors.color(context, 100),
                                highlightColor: AppColors.color(context, 50),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            xText,
                            style: const TextStyle(fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class CardPlaceholder extends StatelessWidget {
  final String title;
  final Widget widget;
  const CardPlaceholder({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeLarge),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            widget,
          ],
        ),
      ),
    );
  }
}

class PieChartShimmer extends StatelessWidget {
  const PieChartShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.color(context, 100),
      highlightColor: AppColors.color(context, 50),
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
