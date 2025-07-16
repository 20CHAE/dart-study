//p387

import 'dart:io';
import 'dart:convert';

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  printHttpServerActivated(server);

  // 요청 처리하기
  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);
    try {
      var content = await utf8.decoder.bind(request).join();
      // jsondecode:json형태로 변환
      // as map : 변환데이터를 dart에서 사용할 수 없어서 map형태로 변환
      var jsonData = jsonDecode(content) as Map;

      //p389 확인차 key에 따른 value 추출해보기
      print("content $jsonData");
      print("Korea : ${jsonData['Korea']}");
      print("Japan : ${jsonData['Japan']}");
      print("China : ${jsonData['China']}");

      content = "POST JSON accepted";
      request.response
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = content.length
        ..statusCode = HttpStatus.ok
        ..write(content);
      await request.response.close();
      //
    } catch (err) {
      print("\$ Exception in http request processing");
    }
  }
}

// ----------------------------------------------------------------
void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print('\$ Server activated in ${ip}:${port}');
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;
  print("\$ $method $path from $ip:$port");

  if (request.headers.contentLength != -1) {
    print("\> content-type   : ${request.headers.contentType}");
    print("\> content-length : ${request.headers.contentLength}");
  }
}
