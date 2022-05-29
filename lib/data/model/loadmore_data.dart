import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class LoadMoreData<T> {
  final List<T> data;
  final int? page;
  final int? totalPages;

  LoadMoreData({required this.data, required this.page, required this.totalPages});
}
