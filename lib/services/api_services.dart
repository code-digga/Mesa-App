import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  http.Client _getClient() {
    if (Platform.isAndroid) {
      final engine = CronetEngine.build(
          cacheMode: CacheMode.memory,
          cacheMaxSize: 2 * 1024 * 1024,
          enableBrotli: true,
          enableHttp2: true);
      return CronetClient.fromCronetEngine(engine, closeEngine: true);
    } else if (Platform.isIOS) {
      final config = URLSessionConfiguration.defaultSessionConfiguration()
        ..cache = URLCache.withCapacity(memoryCapacity: 2 * 1024 * 1024);

      return CupertinoClient.fromSessionConfiguration(config);
    }
    return IOClient();
  }

  Future<http.Response> getRequest(
      {String? endpoint,
      Map<String, dynamic>? reqQuery,
      bool isProtected = true}) async {
    var resp = http.Response('Request Faild', 400);
    try {
      resp = await _getClient().get(Uri.https('', endpoint ?? '', reqQuery),
          headers: isProtected ? fetchHeaders() : null);
    } catch (e) {
      resp = errorHandler(e);
    }

    return resp;
  }

  Future<http.Response> postRequest(
      {String? endpoint,
      Map<String, dynamic>? reqQuery,
      Map<String, dynamic>? reqBody,
      bool isProtected = true}) async {
    var resp = http.Response('Request Faild', 400);
    try {
      resp = await _getClient().post(Uri.https('', endpoint ?? '', reqQuery),
          headers: isProtected ? fetchHeaders() : null, body: reqBody);
    } catch (e) {
      resp = errorHandler(e);
    }

    return resp;
  }

  Future<http.Response> putRequest(
      {String? endpoint,
      Map<String, dynamic>? reqQuery,
      Map<String, dynamic>? reqBody,
      bool isProtected = true}) async {
    var resp = http.Response('Request Faild', 400);
    try {
      resp = await _getClient().put(Uri.https('', endpoint ?? '', reqQuery),
          headers: isProtected ? fetchHeaders() : null, body: reqBody);
    } catch (e) {
      resp = errorHandler(e);
    }

    return resp;
  }

  Future<http.Response> deleteRequest(
      {String? endpoint,
      Map<String, dynamic>? reqQuery,
      Map<String, dynamic>? reqBody,
      bool isProtected = true}) async {
    var resp = http.Response('Request Faild', 400);
    try {
      resp = await _getClient().delete(Uri.https('', endpoint ?? '', reqQuery),
          headers: isProtected ? fetchHeaders() : null, body: reqBody);
    } catch (e) {
      resp = errorHandler(e);
    }

    return resp;
  }

  Future<http.Response> requestWithFile(
      {String? endpoint,
      Map<String, dynamic>? reqQuery,
      Map<String, String>? reqBody,
      Map<String, dynamic> fileNamePathMap = const {},
      bool isPost = true,
      bool isProtected = true}) async {
    var resp = http.Response('Request Faild', 400);
    try {
      var request = http.MultipartRequest(
        isPost ? 'POST' : 'PUT',
        Uri.https('', endpoint ?? '', reqQuery),
      );
      if (reqBody?.isNotEmpty ?? false) {
        request.fields.addAll(reqBody ?? {});
      }

      //The files to add (fileNamePath) take the form
      //{ "field_name_in_request_body": "file_path"}
      fileNamePathMap.forEach((fieldName, filePath) {
        var file = File(filePath);
        request.files.add(http.MultipartFile.fromBytes(
            fieldName, file.readAsBytesSync(),
            filename: file.path.split(Platform.pathSeparator).last));
      });
      var response = await request.send();
      resp = await http.Response.fromStream(response);
    } catch (e) {
      resp = errorHandler(e);
    }

    return resp;
  }

  http.Response errorHandler(Object e) {
    if (e is SocketException) {
      return http.Response(e.message, 504);
    }
    return http.Response(e.toString(), 503);
  }

  Map<String, String> fetchHeaders() {
    var token = '';
    SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString('token') ?? '';
    });
    return {"Authorization": 'Bearer $token'};
  }
}
