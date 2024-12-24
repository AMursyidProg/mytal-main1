import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';

class PageNumber extends StatefulWidget {
  const PageNumber({
    super.key,
    required PaginatorController controller,
  }) : _controller = controller;

  final PaginatorController _controller;

  @override
  PageNumberState createState() => PageNumberState();
}

class PageNumberState extends State<PageNumber> {
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(update);
  }

  @override
  void dispose() {
    widget._controller.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget._controller.isAttached
        ? 'Page: ${1 + ((widget._controller.currentRowIndex + 1) / widget._controller.rowsPerPage).floor()} of '
            '${(widget._controller.rowCount / widget._controller.rowsPerPage).ceil()}'
        : 'Page: x of y');
  }
}

class CustomPager extends StatefulWidget {
  const CustomPager(this.controller, {super.key});

  final PaginatorController controller;

  @override
  CustomPagerState createState() => CustomPagerState();
}

class CustomPagerState extends State<CustomPager> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // skip this build pass
    if (!widget.controller.isAttached) return const SizedBox();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.color(context, 50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () => widget.controller.goToFirstPage(), icon: const Icon(Icons.skip_previous)),
          IconButton(onPressed: () => widget.controller.goToPreviousPage(), icon: const Icon(Icons.chevron_left_sharp)),
          PageNumber(controller: widget.controller),
          IconButton(onPressed: () => widget.controller.goToNextPage(), icon: const Icon(Icons.chevron_right_sharp)),
          IconButton(onPressed: () => widget.controller.goToLastPage(), icon: const Icon(Icons.skip_next))
        ],
      ),
    );
  }
}

class ErrorAndRetry extends StatelessWidget {
  const ErrorAndRetry(this.errorMessage, this.retry, {super.key});

  final String errorMessage;
  final void Function() retry;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            height: 200,
            color: Colors.red,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Oops! $errorMessage', style: const TextStyle(color: Colors.white)),
              TextButton(
                  onPressed: retry,
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    Text('Retry', style: TextStyle(color: Colors.white))
                  ]))
            ])),
      );
}

class AppTable extends StatelessWidget {
  final PaginatorController controller;
  final List<DataColumn> columns;
  final AsyncDataTableSource tableDataSource;
  final double? minWidth;
  final int fixedLeftColumn;
  const AppTable(
      {super.key, required this.controller, required this.columns, required this.tableDataSource, this.minWidth, this.fixedLeftColumn = 0});

  final int rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AsyncPaginatedDataTable2(
              minWidth: minWidth,
              horizontalMargin: 20,
              showCheckboxColumn: false,
              columnSpacing: Dimensions.paddingSizeDefault,
              wrapInCard: false,
              rowsPerPage: rowsPerPage,
              headingRowColor: WidgetStateProperty.all(AppColors.color(context, 50)),
              border: TableBorder(
                horizontalInside: BorderSide(width: 1, color: AppColors.color(context, 50), style: BorderStyle.solid),
              ),
              fit: FlexFit.tight,
              fixedLeftColumns: fixedLeftColumn,
              initialFirstRowIndex: 0,
              hidePaginator: true,
              controller: controller,
              columns: columns,
              empty: Center(child: Container(padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
              loading: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
              errorBuilder: (e) => ErrorAndRetry(e.toString(), () => tableDataSource.refreshDatasource()),
              source: tableDataSource),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        CustomPager(controller)
      ],
    );
  }
}
