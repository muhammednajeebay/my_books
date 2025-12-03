import 'package:flutter/foundation.dart';
import 'package:my_books/models/book_model.dart';
import 'package:my_books/services/api_service.dart';

class BooksController extends ChangeNotifier {
  BooksController({ApiService? apiService})
      : _apiService = apiService ?? ApiService() {
    init();
  }

  final ApiService _apiService;

  final List<Work> _works = [];
  bool _initialLoading = false;
  bool _loadingMore = false;
  String? _errorMessage;
  int _currentPage = 1;
  bool _hasMore = true;

  List<Work> get works => List.unmodifiable(_works);
  bool get isInitialLoading => _initialLoading;
  bool get isLoadingMore => _loadingMore;
  String? get errorMessage => _errorMessage;
  bool get hasMore => _hasMore && !_loadingMore;

  Future<void> init() async {
    if (_initialLoading) return;
    _initialLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _fetchPage(reset: true);
    } catch (error) {
      _errorMessage = _errorFound(error);
    } finally {
      _initialLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _hasMore = true;
    await _fetchPage(reset: true);
  }

  Future<void> loadMore() async {
    if (!hasMore) return;
    _loadingMore = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _currentPage += 1;
      await _fetchPage();
    } catch (error) {
      _currentPage -= 1;
      _errorMessage = _errorFound(error);
    } finally {
      _loadingMore = false;
      notifyListeners();
    }
  }

  Future<void> _fetchPage({bool reset = false}) async {
    final response = await _apiService.fetchNovels(page: _currentPage);
    if (reset) _works.clear();
    final newItems = response.works ?? [];

    _works.addAll(newItems);
    _hasMore = newItems.isNotEmpty &&
        _works.length < (response.workCount ?? _works.length);
  }

  String _errorFound(Object error) {
    if (error is NetworkException) return 'No internet connection detected.';
    if (error is ApiException) return error.message;
    return 'Something went wrong. Please try again.';
  }

  @override
  void dispose() {
    _apiService.dispose();
    super.dispose();
  }
}