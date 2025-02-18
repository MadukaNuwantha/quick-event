import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  Future<Response> _makeRequest({
    required String endpoint,
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response;
      switch (method) {
        case 'GET':
          response = await _dio.get(endpoint, queryParameters: queryParameters);
          break;
        case 'POST':
          response = await _dio.post(endpoint, data: data);
          break;
        case 'PUT':
          response = await _dio.put(endpoint, data: data);
          break;
        case 'DELETE':
          response = await _dio.delete(endpoint);
          break;
        default:
          throw Exception('Invalid HTTP method: $method');
      }
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    return await _makeRequest(endpoint: endpoint, method: 'GET', queryParameters: queryParameters);
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    return await _makeRequest(endpoint: endpoint, method: 'POST', data: data);
  }

  Future<Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    return await _makeRequest(endpoint: endpoint, method: 'PUT', data: data);
  }

  Future<Response> deleteRequest(String endpoint) async {
    return await _makeRequest(endpoint: endpoint, method: 'DELETE');
  }
}
