import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createFactory: false,
  createToJson: false,
  explicitToJson: false,
)
class Paging<T> {
  final int? total;
  final int? pageSize;
  final int? pageNumber;
  final List<T> rows;

  Paging({
    this.total,
    this.pageSize,
    this.pageNumber,
    required this.rows,
  });

  Paging.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT)
      : total = json['total'] as int?,
        pageSize = json['page_size'] as int?,
        pageNumber = json['page_number'] as int?,
        rows = (json['rows'] as List<dynamic>).map(fromJsonT).toList();

  @override
  String toString() {
    return 'Paging(total: $total, pageSize: $pageSize, pageNumber: $pageNumber, rows: $rows)';
  }
}
