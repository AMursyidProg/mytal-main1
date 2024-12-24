import 'dart:async';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/transfusion_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/util/globals.dart';
import 'package:mytal/view/widgets/add_transfusion_dialog.dart';
import 'package:mytal/view/widgets/table_components.dart';

class TransfusionTable extends StatefulWidget {
  final int? patientId;
  final Function? onSave;
  const TransfusionTable({this.patientId, this.onSave, super.key});

  @override
  TransfusionTableState createState() => TransfusionTableState();
}

class TransfusionTableState extends State<TransfusionTable> {
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
        label: Text('Volume (ml)'),
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
      appBar: AppBar(title: const Text("Blood Transfusion")),
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

  void _onRowTap(TransfusionModel transfusion) async {
    await showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AddTransfusionDialog(
          patientId: patientId,
          transfusion: transfusion,
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
        x.transfusion.map((transfusion) {
          return DataRow(
            key: ValueKey<int>(transfusion.id),
            cells: [
              DataCell(
                onTap: () => _onRowTap(transfusion),
                Text(DateFormat('d MMM y').format(DateTime.parse(transfusion.dateTransfusion))),
              ),
              DataCell(
                onTap: () => _onRowTap(transfusion),
                Text(transfusion.volume.toString()),
              ),
            ],
          );
        }).toList());

    return r;
  }
}

class TableWebService {
  Future<TransfusionResponse> getData(int startingAt, int count, int? patientId) async {
    int pageNumber = (startingAt / count).floor() + 1;
    TransfusionResponse response = await GetIt.I.get<ApiClient>().getTransfusion(pageNumber, patientId);
    return response;
  }
}
