import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:http/io_client.dart';

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
      Map<String, String>? reqHeaders,
      bool isProtected = false}) async {
    var resp = http.Response('Request Faild', 400);
    try {
      resp = await _getClient()
          .get(Uri.https('', endpoint ?? '', reqQuery), headers: reqHeaders);
    } on SocketException catch (e) {
      resp = http.Response(e.message, 504);
    } catch (e) {
      resp = http.Response(e.toString(), 503);
    }

    return resp;
  }

  http.Response errorHandler(Exception e) {
    switch (e.runtimeType) {
      case const (SocketException):
        return http.Response(e.message, 504);
    }
  }
}
