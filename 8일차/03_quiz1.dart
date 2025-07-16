// 기존에 학습했던 http 코드들을 참고하여 사용자를 CRUD 할 수 있는 RESTful 프로그램을 작성하고자 합니다.
// 다음의 코드들을 참고하여 RESTful 프로그램을 완성하세요.

import 'dart:convert';
import 'dart:io';

void create(Map database, HttpRequest request) async {
  // 생성 코드 작성
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content  : $content");
  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (database.containsKey(key) == false) {
    database[key] = value;
    content = "Success < $key join us >";
  } else {
    content = "Fail <$key already exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

void read(Map database, HttpRequest request) async {
  // 조회 코드 작성
  var key = request.uri.pathSegments.last;
  var content, transaction;
  if (database.containsKey(key) == true) {
    transaction = {};
    transaction[key] = database[key];
    content = "Success < $transaction retrieved >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

// 업데이트
void update(Map database, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (database.containsKey(key) == true) {
    database[key] = value;
    content = "Success < $transaction updated >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

// 삭제
void delete(Map database, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content, value;

  if (database.containsKey(key) == true) {
    value = database[key];
    database.remove(key);
    content = "Success < {$key, $value} deleted >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

Future main() async {
  var database = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains('/api/') == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          // 메서드들에 대한 CASE 작성
          case 'POST':
            create(database, request);
            break;
          case 'GET':
            read(database, request);
            break;
          case 'PUT':
            update(database, request);
            break;
          case 'DELETE':
            delete(database, request);
            break;
          default:
            print("\$ not supported method");
            break;
        }
      } catch (err) {
        print("\$ Exception in http request processing");
      }
    } else {
      printAndSendHttpResponse(
        database,
        request,
        "${request.method} {ERROR: Unsupported API}",
      );
    }
  }
}

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print('\$ Server activated in $ip:$port');
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;

  print('\$ $method $path from $ip:$port');

  if (request.headers.contentLength != -1) {
    print('\> content-type: ${request.headers.contentType}');
    print('\> content-lendth: ${request.headers.contentLength}');
  }
}

void printAndSendHttpResponse(
  Map database,
  HttpRequest request,
  String content,
) async {
  print("\$ $content \n current DB      : $database");
  var bytes = utf8.encode(content);

  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
    ..headers.contentLength = bytes.length
    ..statusCode = HttpStatus.ok
    ..add(bytes);

  await request.response.close();
}
