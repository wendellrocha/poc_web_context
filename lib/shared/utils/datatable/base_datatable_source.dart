import 'package:flutter/material.dart';

class BaseDataTableSource<T> extends DataTableSource {
  final List<T> data;

  BaseDataTableSource(this.data);

  @override
  DataRow? getRow(int index) {
    throw UnimplementedError('Not implemented');
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
