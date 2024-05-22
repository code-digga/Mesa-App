import 'dart:convert';

import 'package:mesa_app/services/api_services.dart';
import 'package:mesa_app/services/storage_service.dart';
import 'package:http/http.dart' as http;

import '../models/network_response.dart';

class Repository extends ApiService with PrefsStorage {
  Future<NetworkResponse> makeRequest(String requestType,
      {String? endpoint,
      Map<String, dynamic>? reqQuery,
      Map<String, dynamic>? reqBody,
      bool isProtected = true}) async {
    var initialResponse = NetworkResponse(
        success: false, message: 'Could not make request', data: null);
    switch (requestType) {
      case 'get':
        var response = await getRequest(
            endpoint: endpoint, reqQuery: reqQuery, isProtected: isProtected);
        initialResponse = parseData(response);
        break;
      case 'post':
        var response = await postRequest(
            endpoint: endpoint, reqQuery: reqQuery, isProtected: isProtected);
        initialResponse = parseData(response);
        break;
      case 'put':
        var response = await putRequest(
            endpoint: endpoint, reqQuery: reqQuery, isProtected: isProtected);
        initialResponse = parseData(response);
        break;
      case 'delete':
        var response = await deleteRequest(
            endpoint: endpoint, reqQuery: reqQuery, isProtected: isProtected);
        initialResponse = parseData(response);
        break;
    }
    return initialResponse;
  }

  NetworkResponse parseData(http.Response data) {
    if (data.statusCode == 504 || data.statusCode == 503) {
      return NetworkResponse(
          success: false, message: jsonDecode(data.body), data: null);
    }
    return NetworkResponse.fromJson(data.body);
  }
}
