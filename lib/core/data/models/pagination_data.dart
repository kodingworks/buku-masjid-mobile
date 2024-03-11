/// Represents paginated data.
class PaginationData<T> {
  /// The last page number.
  final int lastPage;

  /// The current page number.
  final int currentPage;

  /// The list of data items.
  final List<T> data;

  /// Constructs a [PaginationData].
  PaginationData({
    required this.lastPage,
    required this.currentPage,
    required this.data,
  });

  /// Creates a [PaginationData] instance from JSON data.
  factory PaginationData.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    List<T> datas = <T>[];

    if (json['data'] != null) {
      json['data'].forEach((dynamic item) {
        datas.add(fromJsonT(item as Map<String, dynamic>));
      });
    }

    return PaginationData(
      data: datas,
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
    );
  }
}
