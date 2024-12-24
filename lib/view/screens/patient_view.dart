import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/admin/admin_patient_model.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/util/globals.dart';
import 'package:mytal/view/screens/patient_detail_screen.dart';
import 'package:mytal/view/widgets/admin/admin_add_patient_dialog.dart';
import 'package:mytal/view/widgets/table_components.dart';

class PatientView extends StatefulWidget {
  const PatientView({Key? key}) : super(key: key);

  @override
  PatientViewState createState() => PatientViewState();
}

class PatientViewState extends State<PatientView> {
  TableDataSourceAsync? _tableDataSource;
  final PaginatorController _controller = PaginatorController();
  final bool _dataSourceLoading = false;
  final _searchController = TextEditingController();
  bool _searching = false;
  Timer? _debounce;

  @override
  void didChangeDependencies() {
    // initState is to early to access route options, context is invalid at that stage
    _tableDataSource = TableDataSourceAsync();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tableDataSource!.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  List<DataColumn> get _columns {
    return [
      const DataColumn2(
        label: Text('Name'),
      ),
      const DataColumn(
        label: Text('NRIC'),
      ),
      const DataColumn(
        label: Text('DOB'),
      ),
      const DataColumn(
        label: Text('Sex'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, 0),
            child: Row(
              children: [
                Expanded(
                  child: SearchBar(
                    elevation: WidgetStateProperty.all(1),
                    controller: _searchController,
                    onChanged: (String value) async {
                      setState(() => _searching = value.isNotEmpty);

                      if (_debounce?.isActive ?? false) _debounce!.cancel();

                      _debounce = Timer(const Duration(milliseconds: 500), () {
                        _tableDataSource!.searchFilter = value;
                      });
                    },
                    leading: const Icon(Icons.search, color: Colors.grey),
                    trailing: _searching
                        ? [
                            IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _searching = false);
                                _tableDataSource!.searchFilter = null;
                              },
                            )
                          ]
                        : [],
                    hintText: "Search...",
                    hintStyle: WidgetStateProperty.all(const TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeDefault),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const CreatePatientScreen()),
                    // );
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AdminAddPatientDialog(
                          onSave: () {
                            _tableDataSource!.refreshDatasource();
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text(
                    'New',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          Expanded(
            child: _dataSourceLoading
                ? const SizedBox()
                : AppTable(
                    columns: _columns,
                    controller: _controller,
                    tableDataSource: _tableDataSource!,
                    minWidth: 500,
                    fixedLeftColumn: 1,
                  ),
          ),
          // ListView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: _patients.length,
          //   itemBuilder: (context, index) {
          //     var patient = _patients[index];
          //     return Column(
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => PatientDetailScreen(patientId: patient['id'])),
          //             );
          //           },
          //           child: Card(
          //               child: Column(
          //             children: [
          //               Container(
          //                   padding: const EdgeInsets.all(4),
          //                   width: double.infinity,
          //                   decoration: BoxDecoration(
          //                     color: Colors.teal[700],
          //                     borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
          //                   ),
          //                   child: Text('${patient['centre']} Centre',
          //                       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
          //               Padding(
          //                 padding: const EdgeInsets.all(12.0),
          //                 child: Row(
          //                   children: [
          //                     Container(
          //                       padding: const EdgeInsets.all(5),
          //                       decoration: BoxDecoration(
          //                         color: Colors.teal[200],
          //                         borderRadius: BorderRadius.circular(100),
          //                       ),
          //                       child: Icon(Icons.person, size: 40, color: Colors.teal[50]),
          //                     ),
          //                     const SizedBox(width: 16),
          //                     Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Text(patient['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          //                         const SizedBox(height: 5),
          //                         Row(
          //                           children: [Text('IC: ${patient['mykad']}', style: const TextStyle(color: Colors.black54, fontSize: 13))],
          //                         ),
          //                         const SizedBox(height: 5),
          //                         Row(
          //                           children: [
          //                             Text(
          //                                 'DOB: ${patient['dob']} (Age: ${Dates.calculateAge(
          //                                   DateTime.parse(patient['dob']),
          //                                 )})',
          //                                 style: const TextStyle(color: Colors.black54, fontSize: 13)),
          //                           ],
          //                         ),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           )
          //               // child: ListTile(

          //               //   title: Text(_patients[index]['name']),
          //               //   subtitle: Text(_patients[index]['mykad']),
          //               // ),
          //               ),
          //         ),
          //         const SizedBox(height: 10),
          //       ],
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

class TableDataSourceAsync extends AsyncDataTableSource {
  int? _errorCounter;
  final TableWebService _repo = TableWebService();

  void _onRowTap(AdminPatientModel patient) => {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => PatientDetailScreen(patient: patient),
          ),
        )
      };

  String? _searchFilter;

  String? get searchFilter => _searchFilter;
  set searchFilter(String? calories) {
    _searchFilter = calories;
    refreshDatasource();
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

    var x = await _repo.getData(startIndex, count, _searchFilter);

    var r = AsyncRowsResponse(
        x.metaData!.totalCount,
        x.patients.map((patient) {
          return DataRow(
            key: ValueKey<int>(patient.id),
            cells: [
              DataCell(
                onTap: () => _onRowTap(patient),
                Text(patient.name),
              ),
              DataCell(
                onTap: () => _onRowTap(patient),
                Text(patient.nric ?? ""),
              ),
              DataCell(
                onTap: () => _onRowTap(patient),
                Text(DateFormat('d MMM y').format(DateTime.parse(patient.dob))),
              ),
              DataCell(
                onTap: () => _onRowTap(patient),
                Text(patient.sexDescr),
              ),
            ],
          );
        }).toList());

    return r;
  }
}

class TableWebService {
  Future<AdminPatientResponse> getData(int startingAt, int count, String? searchFilter) async {
    int pageNumber = (startingAt / count).floor() + 1;
    AdminPatientResponse response = await GetIt.I.get<ApiClient>().adminGetPatients(pageNumber, searchFilter);
    return response;
  }
}
