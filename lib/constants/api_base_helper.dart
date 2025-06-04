import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/secure_storage.dart';
import '../models/base_response.dart';
import '../utils/enums.dart';

class ApiBaseHelper {
  final String baseUrl = BaseUrls.prodUrl.url;
  final SecureStorage _secureStorage = SecureStorage();

  Future<Map<String, String>> _getHeaders({bool requiresAuth = true}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final token = await _secureStorage.getAuthToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  Future<dynamic> get(String endpoint, {bool requiresAuth = true}) async {
    try {
      final headers = await _getHeaders(requiresAuth: requiresAuth);
      final response = await http.get(
        Uri.parse(baseUrl + endpoint),
        headers: headers,
      );
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      throw Exception('Error occurred while getting data: $e');
    }
  }

  Future<dynamic> post(String endpoint, dynamic body, {bool requiresAuth = true}) async {
    try {
      final headers = await _getHeaders(requiresAuth: requiresAuth);
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: headers,
        body: json.encode(body),
      );
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      throw Exception('Error occurred while posting data: $e');
    }
  }

  Future<dynamic> put(String endpoint, dynamic body, {bool requiresAuth = true}) async {
    try {
      final headers = await _getHeaders(requiresAuth: requiresAuth);
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        headers: headers,
        body: json.encode(body),
      );
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      throw Exception('Error occurred while updating data: $e');
    }
  }

  Future<dynamic> delete(String endpoint, {bool requiresAuth = true}) async {
    try {
      final headers = await _getHeaders(requiresAuth: requiresAuth);
      final response = await http.delete(
        Uri.parse(baseUrl + endpoint),
        headers: headers,
      );
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      throw Exception('Error occurred while deleting data: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw Exception(BaseResponseModel.fromJson(json.decode(response.body)).message ?? 'Bad Request');
      case 401:
      case 403:
        throw Exception(BaseResponseModel.fromJson(json.decode(response.body)).message ?? 'Unauthorized');
      case 404:
        throw Exception(BaseResponseModel.fromJson(json.decode(response.body)).message ?? 'Not Found');
      case 500:
      default:
        throw Exception('Error occurred while communicating with server with status code: ${response.statusCode}');
    }
  }
}
