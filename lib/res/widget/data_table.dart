import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
///
/// WebDataTableSource
///
class WebDataTableSource extends DataTableSource {
  WebDataTableSource({
    required this.columns,
    required this.rows,
    this.onTapRow,
    this.onSelectRows,
    this.sortColumnName,
    this.sortAscending = true,
    this.primaryKeyName,
    this.filterTexts,
    this.selectedRowKeys = const [],
  }) {
    if (onSelectRows != null) {
      assert(primaryKeyName != null);
    }
    _rows = [...rows];
    _executeFilter();
    _executeSort();
  }

  final List<WebDataColumn> columns;
  final List<Map<String, dynamic>> rows;
  late List<Map<String, dynamic>> _rows;
  final Function(List<Map<String, dynamic>> rows, int index)? onTapRow;
  final Function(List<String> selectedRowKeys)? onSelectRows;
  String? sortColumnName;
  bool sortAscending;
  final String? primaryKeyName;
  final List<String>? filterTexts;
  final List<String> selectedRowKeys;

  @override
  DataRow getRow(int index) {
    List<DataCell> cells = [];
    for (final column in columns) {
      cells.add(column.dataCell(_rows[index][column.name]));
    }

    final key =
        primaryKeyName != null ? _rows[index][primaryKeyName].toString() : null;
    return DataRow.byIndex(
        index: index,
        cells: cells,
        selected: key != null ? selectedRowKeys.contains(key) : false,
        onSelectChanged: (selected) {
          if (onTapRow != null) {
            onTapRow!(_rows, index);
          }
          if (onSelectRows != null && key != null) {
            final keys = [...selectedRowKeys];
            if (selected != null && selected) {
              keys.add(key);
            } else {
              keys.remove(key);
            }
            onSelectRows!(keys);
          }
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _rows.length;

  @override
  int get selectedRowCount => 0;

  void _executeSort() {
    if (sortColumnName == null) {
      return;
    }

    final column = _findColumn(sortColumnName!);
    final cmp = column?.comparable;
    _rows.sort((Map<String, dynamic> a, Map<String, dynamic> b) {
      final aValue =
          cmp != null ? cmp(a[sortColumnName]) : a[sortColumnName].toString();
      final bValue =
          cmp != null ? cmp(b[sortColumnName]) : b[sortColumnName].toString();
      return sortAscending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
  }

  void _executeFilter() {
    if (filterTexts == null || filterTexts!.isEmpty) {
      return;
    }

    _rows.clear();
    for (Map<String, dynamic> row in rows) {
      final List<String> valueTexts = [];
      for (final name in row.keys.toList()) {
        final column = _findColumn(name);
        String text = row[name].toString();
        if (column?.filterText != null) {
          text = column!.filterText!(row[name]);
        }
        valueTexts.add(text);
      }

      int containCount = 0;
      for (final filterText in filterTexts!) {
        for (final valueText in valueTexts) {
          if (valueText.contains(filterText)) {
            containCount++;
            break;
          }
        }
      }
      if (containCount == filterTexts!.length) {
        _rows.add(row);
      }
    }
  }

  WebDataColumn? _findColumn(String name) {
    final founds = columns.where((column) => column.name == name);
    if (founds.isNotEmpty) {
      return founds.first;
    }
    return null;
  }

  int? get sortColumnIndex {
    int? index;
    if (sortColumnName != null) {
      columns.asMap().forEach((i, column) {
        if (column.name == sortColumnName) {
          index = i;
          return;
        }
      });
    }
    return index;
  }

  void selectAll(bool selected) {
    if (onSelectRows == null || primaryKeyName == null) {
      return;
    }

    final List<String> keys = [];
    if (selected) {
      keys.addAll(_rows.map((row) => row[primaryKeyName].toString()).toList());
    }
    onSelectRows!(keys);
  }
}


///
/// WebDataTable
///
class WebDataTable extends StatelessWidget {
  const WebDataTable({
    Key? key,
    this.actions,
    this.dataRowHeight = kMinInteractiveDimension,
    this.headingRowHeight = 56.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 56.0,
    this.initialFirstRowIndex = 0,
    this.onPageChanged,
    this.rowsPerPage = defaultRowsPerPage,
    this.availableRowsPerPage = const [
      defaultRowsPerPage,
      defaultRowsPerPage * 2,
      defaultRowsPerPage * 5,
      defaultRowsPerPage * 10,
    ],
    this.onRowsPerPageChanged,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onSort,
    required this.source,
  }) : super(key: key);

  static const int defaultRowsPerPage = 10;
  final List<Widget>? actions;
  final double dataRowHeight;
  final double headingRowHeight;
  final double horizontalMargin;
  final double columnSpacing;
  final int initialFirstRowIndex;
  final ValueChanged<int>? onPageChanged;
  final int rowsPerPage;
  final List<int> availableRowsPerPage;
  final Function(int? rowsPerPage)? onRowsPerPageChanged;
  final DragStartBehavior dragStartBehavior;
  final Function(String columnName, bool ascending)? onSort;
  final WebDataTableSource source;

  @override
  Widget build(BuildContext context) {
    return  PaginatedDataTable(
      actions: actions,
      columns: source.columns.map((config) {
        return DataColumn(
          label: config.label,
          tooltip: config.tooltip,
          numeric: config.numeric,
          onSort: config.sortable && onSort != null
              ? (columnIndex, ascending) {
                  source.sortColumnName = source.columns[columnIndex].name;
                  source.sortAscending = ascending;
                  if (onSort != null && source.sortColumnName != null) {
                    onSort!(source.sortColumnName!, source.sortAscending);
                  }
                }
              : null,
        );
      }).toList(),
      
      sortColumnIndex: source.sortColumnIndex,
      sortAscending: source.sortAscending,
      onSelectAll: (selected) {
        if (selected != null) source.selectAll(selected);
      },
      dataRowHeight: dataRowHeight,
      headingRowHeight: headingRowHeight,
      horizontalMargin: horizontalMargin,
      columnSpacing: columnSpacing,
      showCheckboxColumn: false,
      initialFirstRowIndex: initialFirstRowIndex,
      onPageChanged: onPageChanged,
      rowsPerPage: rowsPerPage,
      availableRowsPerPage: availableRowsPerPage,
      onRowsPerPageChanged: onRowsPerPageChanged,
      dragStartBehavior: dragStartBehavior,
      source: source,
        
          );
  }
}

///
/// WebDataColumn
///
class WebDataColumn {
  const WebDataColumn({
    required this.name,
    required this.label,
    required this.dataCell,
    this.tooltip,
    this.numeric = false,
    this.sortable = true,
    this.comparable,
    this.filterText,
  });

  final String name;
  final Widget label;
  final DataCell Function(dynamic value) dataCell;
  final String? tooltip;
  final bool numeric;
  final bool sortable;
  final Comparable Function(dynamic value)? comparable;
  final String Function(dynamic value)? filterText;
}