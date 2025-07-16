// quiz2.dart 파일을 참고하여 다음의 기능들을 추가로 구현하세요.
// 1. GET 메서드를 사용해 모든 나라의 수도를 출력하는 기능을 구현하세요.
// 경로는 /all 이며,
// 반환되는 데이터는 JSON 형식이어야 합니다.
// 2. DELETE 메서드를 사용해 입력한 나라를 삭제하는 기능을 구현하세요.
// 경로는 /delete=나라이름 이며,
// 해당 데이터를 삭제한 후 남아있는 나라들을 반환해야 합니다.
// 반환되는 데이터는 JSON 형식이여야 합니다.

import 'dart:io';
import 'dart:convert';

//서버가 실행되고 있는지 확인
void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print("\$ Server activated in ${ip}:${port}");
}

// GET핸들러
void httpGetHandler(HttpRequest request) async {
  Map country = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Austrailia": "Canberra",
  };

  // 요청에 대한 주소가 / 이면
  if (request.uri.path == '/') {
    // 요청받았는지 확인
    print("/로 요청보냄");
  }
  // 요청한 주소에 country 글자 있는지 판별
  if (request.uri.path.contains("/country")) {
    // 뒤에나올 단어 담을 변수생성
    var name = request.uri.path.split("=");
    // 확인 프린트
    // print(name);
    var input = name[1];
    // 맵에 키 있는지 확인
    if (country.containsKey(input)) {
      print("$input 있다요");
      // 변수 생성
      var capital = country[input];
      var result = utf8.encode("$input의 수도는 $capital입니다.");

      // reponse
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = result.length
        ..add(result);
    } else {
      // 나라가 map에 없을 때

      var result = utf8.encode("유효하지 않은 나라를 입력하셨습니다.");
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = result.length
        ..add(result);
    }
    // all -----------------------------------
  } else if (request.uri.path.contains("/all")) {
    //가지고 있는 map를 json으로 변환하기
    var content = jsonEncode(country);

    // response
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.json
      ..headers.contentLength = content.length
      ..write(content);
  }
}

// DELETE핸들러
void httpDeleteHandler(HttpRequest request) async {}

Future main() async {
  Map country = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Austrailia": "Canberra",
  };

  // 서버 생성
  var ip = InternetAddress.loopbackIPv4;
  var port = 8080;
  var server = await HttpServer.bind(ip, port);
  //서버가 실행되고 있는지 확인
  printHttpServerActivated(server);

  // 요청 처리하기
  await for (HttpRequest request in server) {
    // 사용자가 요청시 사용한 메서드에 따라 다른 함수 동작해야됨 -------------
    switch (request.method) {
      case 'GET':
        httpGetHandler(request);
        break; //case에 break필수
      case 'DELETE':
        break;
      default: //case에 대한 예외처리
        print("unsupported http method.");
    }
    // 종료
    await request.response.close();
  }
}
