import 'package:equatable/equatable.dart';

/// Params for empty field.
///
/// If you want to put `Params` in `UseCase` and in usecase no need param,
/// you should use this Params.
class NoParams {
  const NoParams();
}

/// Params for getting data with **Paginating**.
///
/// When implementing infinity load, or paginate get data,
/// this params is very precise.
class PaginateParams extends Equatable {
  /// All field must be initialized and can't null value.
  ///
  /// - [page] required and not nullable.
  /// - [limit] required and not nullable.
  ///
  /// Example:
  ///
  /// ```dart
  /// PaginateParams(
  ///   page: 2,
  ///   limit: 10,
  /// );
  /// ```
  const PaginateParams({required this.page, required this.limit});

  /// Page number params to send into usecase.
  final int page;

  /// Amount of data in [page].
  final int limit;

  @override
  List<Object?> get props => [page, limit];
}

/// This param for advance searching with Paginating.
///
/// Param you can put [query] properties for search and
/// [page] & [perPage] for paginate handle.
class SearchParams extends Equatable {
  /// All field must be initialized and can't null.
  ///
  /// Params [query] for search with keyword.
  ///
  /// Params [page] for handling paginate data.
  const SearchParams({
    required this.query,
    required this.page,
  });

  final String query;

  final int page;

  @override
  List<Object?> get props => [query, page];
}
