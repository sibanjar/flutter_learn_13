import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableExample extends StatelessWidget {
  const TableExample({Key? key});

  void onFirstColumnTap(int rowIndex) {
    // Handle the tap on the first column cell with the given rowIndex
    print('Tapped on the first column cell at index $rowIndex');
    // Add your custom logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 400,
              fixedLeftColumns: 1,
              headingRowColor: MaterialStateColor.resolveWith((states) {
                return Colors.blue; // Example color, you can replace it with your desired color
              }),
              columns: const [
                DataColumn2(
                  label: Text('Column A'),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('Column B'),
                  fixedWidth: 100,
                ),
                DataColumn(
                  label: Text('Column C'),
                ),
                DataColumn(
                  label: Text('Column D'),
                ),
                DataColumn(
                  label: Text('Column NUMBERS'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                100,
                    (index) => DataRow(
                  cells: [
                    DataCell(
                      GestureDetector(
                        onTap: () => onFirstColumnTap(index),
                        child: Text('A' * (10 - index % 10)),
                      ),
                    ),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString())),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
