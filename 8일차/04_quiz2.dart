// quiz1.dart 에서 구현한 사용자DB 를 이용하여 등록된 사용자만이 도서관에서 책을 대여하고, 반납할 수 있는 프로그램을 구현하고자 합니다.
// 도서관에서 대여할 수 있는 종류들은 library 변수에 속해있으며, 현재 대여중인 책들은 RentalStatus 변수에 담겨 있습니다.
// 이미 대여중인 책은 다른 사용자들은 대여할 수 없어야 합니다.
// 도서를 대여하게 될 경우, RentalStatus 에 해당 도서의 value 는 해당 사용자의 ID 로 변경되어야 하며,
// 도서를 반납하게 될 경우, 해당 도서의 value 는 null 로 변경되어야 합니다.
// 한 사용자는 한 도서를 대여한 경우, 추가적으로 대여를 할 수 없습니다.
// 도서를 대여하는 API 는 다음과 같은 구조로 구현되어야 합니다. POST 127.0.0.1:3000/library/rental/{책ID}/{사용자ID}
// 도서를 반납하는 API 는 다음과 같은 구조로 구현되어야 합니다. POST 127.0.0.1:3000/library/return/{책ID}/{사용자ID}

import 'dart:convert';
import 'dart:io';

//책넘버 있나보고, 렌탈여부확인
//if 렌탈안됬으면 status에 사용자id넣고
//사용자 밸류에 책넘버넣기

//메서드 만들기
// rentalBook, returnBook

Future main() async {
  Map users = {};

  Map library = {
    "001": "차라투스트라는 이렇게 말했다.",
    "002": "용의자 X 의 헌신",
    "003": "정의란 무엇인가",
    "004": "존재와 시간",
    "005": "죽음의 수용소에서",
  };

  Map rentalStatus = {
    "001": null,
    "002": null,
    "003": null,
    "004": null,
    "005": null,
  };

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    // 회원 관리-----------------------------
    if (request.uri.path.contains('/library/') == true) {
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
    // rental 대여-------------------------------
    if (request.uri.path.contains('/rental/') == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          // 메서드들에 대한 CASE 작성
          case 'PUT':
            rentalBook(database, request);
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
    // return 반납-------------------------------
    if (request.uri.path.contains('/return/') == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          // 메서드들에 대한 CASE 작성
          case 'PUT':
            returnBook(database, request);
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
