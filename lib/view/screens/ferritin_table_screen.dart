import 'dart:async';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/ferritin_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/util/globals.dart';
import 'package:mytal/view/widgets/add_ferritin_dialog.dart';
import 'package:mytal/view/widgets/table_components.dart';

class FerritinTable extends StatefulWidget {
  final int? patientId;
  final Function? onSave;
  const FerritinTable({this.patientId, this.onSave, super.key});

  @override
  FerritinTableState createState() => FerritinTableState();
}

class FerritinTableState extends State<FerritinTable> {
  TableDataSourceAsync? _tableDataSource;
  final PaginatorController _controller = PaginatorController();
  final bool _dataSourceLoading = false;

  @override
  void didChangeDependencies() {
    // initState is to early to access route options, context is invalid at that stage
    _tableDataSource = TableDataSourceAsync(widget.patientId, widget.onSave);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tableDataSource!.dispose();
    super.dispose();
  }

  List<DataColumn> get _columns {
    return [
      const DataColumn(
        label: Text('Date'),
        // onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
      const DataColumn(
        label: Text('Ferritin Level (ug/L)'),
        numeric: true,
        // onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Last ppage example uses extra API call to get the number of items in datasource
    if (_dataSourceLoading) return const SizedBox();

    return Scaffold(
      appBar: AppBar(title: const Text("Ferritin Levels")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: AppTable(columns: _columns, controller: _controller, tableDataSource: _tableDataSource!),
        ),
      ),
    );
  }
}

class TableDataSourceAsync extends AsyncDataTableSource {
  final int? patientId;
  final Function? onSave;
  TableDataSourceAsync(this.patientId, this.onSave);

  int? _errorCounter;
  final TableWebService _repo = TableWebService();

  void _onRowTap(FerritinModel ferritin) async {
    await showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AddFerritinDialog(
          patientId: patientId,
          ferritin: ferritin,
          onSave: () {
            refreshDatasource();
            onSave?.call();
          },
        );
      },
    );
  }

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    if (_errorCounter != null) {
      _errorCounter = _errorCounter! + 1;

      if (_errorCounter! % 2 == 1) {
        await Future.delayed(const Duration(milliseconds: 1000));
        throw 'Error #${((_errorCounter! - 1) / 2).round() + 1} has occured';
      }
    }

    assert(startIndex >= 0);

    var x = await _repo.getData(startIndex, count, patientId);

    var r = AsyncRowsResponse(
        x.metaData!.totalCount,
        x.ferritin.map((ferritin) {
          return DataRow(
            key: ValueKey<int>(ferritin.id),
            cells: [
              DataCell(
                onTap: () => _onRowTap(ferritin),
                Text(DateFormat('d MMM y').format(DateTime.parse(ferritin.dateMeasured))),
              ),
              DataCell(
                onTap: () => _onRowTap(ferritin),
                Text(ferritin.level.toString()),
              ),
            ],
          );
        }).toList());

    return r;
  }
}

class TableWebService {
  Future<FerritinResponse> getData(int startingAt, int count, int? patientId) async {
    int pageNumber = (startingAt / count).floor() + 1;
    FerritinResponse response = await GetIt.I.get<ApiClient>().getFerritin(pageNumber, patientId);
    return response;
  }
}
