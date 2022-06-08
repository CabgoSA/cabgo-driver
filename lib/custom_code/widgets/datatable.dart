// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class Datatable extends StatefulWidget {
  const Datatable({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _DatatableState createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'TIME',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'DISTANCE',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'AMOUNT',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('25 mins')),
            DataCell(Text('5km')),
            DataCell(Text('R800')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('25 mins')),
            DataCell(Text('5km')),
            DataCell(Text('R800')),
          ],
        ),
      ],
    );
  }
}
