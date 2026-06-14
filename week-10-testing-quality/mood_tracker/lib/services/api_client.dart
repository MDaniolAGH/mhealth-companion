import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../config.dart';
import 'auth_service.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message (status: $statusCode)';
}

class ApiClient {
  final String baseUrl;
  final AuthService _authService;
  // Week 10 — injectable http client for testability.
  final http.Client _client;

  ApiClient({
    this.baseUrl = apiBaseUrl,
    AuthService? authService,
    http.Client? client,
  })  : _authService = authService ?? AuthService(),
        _client = client ?? http.Client();

  Future<Map<String, String>> _getHeaders() async {
    final token = await _authService.getAccessToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> get(String endpoint) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders();
      final response = await _client.get(url, headers: headers);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      }
      throw ApiException(
        'GET $endpoint failed',
        statusCode: response.statusCode,
      );
    } on SocketException {
      throw ApiException('No internet connection. Please check your network.');
    } on HttpException {
      throw ApiException('Server error. Please try again later.');
    } on FormatException {
      throw ApiException('Invalid response from server.');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders();
      final response = await _client.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
      }
      throw ApiException(
        'POST $endpoint failed',
        statusCode: response.statusCode,
      );
    } on SocketException {
      throw ApiException('No internet connection. Please check your network.');
    } on HttpException {
      throw ApiException('Server error. Please try again later.');
    } on FormatException {
      throw ApiException('Invalid response from server.');
    }
  }

  Future<void> delete(String endpoint) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders();
      final response = await _client.delete(url, headers: headers);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ApiException(
          'DELETE $endpoint failed',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      throw ApiException('No internet connection. Please check your network.');
    } on HttpException {
      throw ApiException('Server error. Please try again later.');
    } on FormatException {
      throw ApiException('Invalid response from server.');
    }
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders();
      final response = await _client.put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
      }
      throw ApiException(
        'PUT $endpoint failed',
        statusCode: response.statusCode,
      );
    } on SocketException {
      throw ApiException('No internet connection. Please check your network.');
    } on HttpException {
      throw ApiException('Server error. Please try again later.');
    } on FormatException {
      throw ApiException('Invalid response from server.');
    }
  }
}
