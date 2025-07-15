// p359
// http에서 가장많이 쓰는 메서드 4가지
// 1. get : 클라이언트가 서버에게 어떤것을 읽겠다고 요청
// 2. post : 서버에게 어떤것을 쓰겠다(생성하겠다)고 요청
// 3. put : 서버에게 어떤것을 쓰겠다(수정하겠다)고 요청
// 4. delete : 서버에게 어떤 것을 삭제하겠다고 요청

// p366
import 'dart:io';
import 'dart:convert';

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print("\$ Server activated in${ip}:${port}");
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;
  print("\$ $method #path form $ip:$port");

  if (request.headers.contentLength != -1) {
    print("\> content-type : ${request.headers.contentType}");
    print("\> content-length : ${request.headers.contentLength}");
  }
}

//p367 get request처리 함수
void httpGetHandler(HttpRequest request) async {
  if (request.uri.path == '/') {
    var content = "Hello, World!";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (request.uri.path.contains('/add')) {
    var vars = request.uri.path.split(',');
    var result = int.parse(vars[1]) + int.parse(vars[2]);
    var content = "${vars[1]} + ${vars[2]} = $result";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (await File(request.uri.path.substring(1)).exists() == true) {
    var file = File(request.uri.path.substring(1));
    var content = await file.readAsString();
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    // 예외처리
    var content = "Unsupporrted URI";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      //notFound로 처리
      ..write(content);
  }
  await request.response.close();
}

//p369 put request처리 함수
void httpPutHanlder(var addr, var port, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var file = await File(request.uri.path.substring(1)).openWrite();
  print("\> content         : ${content}");
  file
    ..write(content)
    ..close();
  content = 'http://$addr:$port${request.uri.path} created';
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

//p370 post request처리 함수
void httpPostHandler(HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  // = 으로 포스트를 보냄
  var product = content.split("=");
  print("\> content        : ${content}");
  content = "Product '${product[1]}' accepted";
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

//p371 delete request처리 함수
void httpDeleteHandler(HttpRequest request) async {
  var filename = request.uri.path.substring(1);
  //파일 이름이 있다면
  if (await File(filename).exists() == true) {
    var content = "$filename deleted";
    File(filename).deleteSync();
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    var content = "$filename not found";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      ..write(content);
  }
  await request.response.close();
}

Future main() async {
  //p372
  var ip = InternetAddress.loopbackIPv4;
  var port = 3000;
  var server = await HttpServer.bind(ip, port);
  printHttpServerActivated(server);
  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);
    try {
      switch (request.method) {
        case 'GET':
          httpGetHandler(request);
          break;
        case 'PUT':
          httpPutHanlder(server.address.address, server.port, request);
          break;
        case "POST":
          httpPostHandler(request);
          break;
        case 'DELETE':
          httpDeleteHandler(request);
          break;
        default:
          print("unsupported http method");
      }
    } catch (err) {
      print("에러");
    }
  }
}
