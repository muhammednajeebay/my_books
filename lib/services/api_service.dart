import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_books/models/book_model.dart';

/// Global API layer for talking to Open Library.
class ApiService {
  ApiService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'openlibrary.org';
  static const _novelPath = '/subjects/novel.json';

  /// Fetches novels with pagination support.
  Future<BookModel> fetchNovels({int page = 1, int pageSize = 20}) async {
    final offset = (page - 1).clamp(0, double.infinity).toInt() * pageSize;
    final uri = Uri.https(_baseUrl, _novelPath, {
      'limit': pageSize.toString(),
      'offset': offset.toString(),
    });

    try {
      final response = await _httpClient.get(uri);

      if (response.statusCode == 200) {
        return BookModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      }

      throw ApiException(
        message: 'Failed to load novels',
        statusCode: response.statusCode,
        details: response.body,
      );
    } on SocketException {
      throw const NetworkException('No internet connection');
    } on FormatException {
      throw const ParsingException('Malformed response from server');
    } catch (error) {
      throw ApiException(message: 'Unexpected error', details: '$error');
    }
  }

  /// Call when the service is no longer needed.
  void dispose() => _httpClient.close();
}

class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode, this.details});

  final String message;
  final int? statusCode;
  final String? details;

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message, details: $details)';
}

class NetworkException extends ApiException {
  const NetworkException(String message) : super(message: message);
}

class ParsingException extends ApiException {
  const ParsingException(String message) : super(message: message);
}