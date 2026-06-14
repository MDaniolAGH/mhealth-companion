import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

class AuthService {
  // Week 10 — both dependencies are injectable for testability.
  // In production (default), a real http.Client + real FlutterSecureStorage
  // are used. In tests, mocks are passed in.
  final http.Client _client;
  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  AuthService({http.Client? client, FlutterSecureStorage? storage})
      : _client = client ?? http.Client(),
        _storage = storage ?? const FlutterSecureStorage();

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> deleteTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('$apiBaseUrl/auth/login');
    final response = await _client.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await saveTokens(
        data['access_token'] as String,
        data['refresh_token'] as String,
      );
    } else if (response.statusCode == 401) {
      throw AuthException('Incorrect email or password.');
    } else {
      throw AuthException('Login failed. Please try again.');
    }
  }

  Future<void> register(
      String email, String username, String password) async {
    final url = Uri.parse('$apiBaseUrl/auth/register');
    final response = await _client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      return;
    } else if (response.statusCode == 400) {
      final data = jsonDecode(response.body);
      throw AuthException(data['detail'] as String);
    } else {
      throw AuthException('Registration failed. Please try again.');
    }
  }
}
