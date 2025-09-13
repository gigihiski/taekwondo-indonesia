import 'dart:convert';

class Pagination {
  final int totalCount;
  final int pageCount;
  final int currentPage;
  final int perPage;

  Pagination({
    required this.totalCount,
    required this.pageCount,
    required this.currentPage,
    required this.perPage,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str)["meta"]);

  factory Pagination.fromMap(Map<String, dynamic> map) => Pagination(
        totalCount: map["total_count"],
        pageCount: map["page_count"],
        currentPage: map["current_page"],
        perPage: map["per_page"],
      );

  Map<String, dynamic> toMap() => {
        "total_count": totalCount,
        "page_count": pageCount,
        "current_page": currentPage,
        "per_page": perPage,
      };
}
