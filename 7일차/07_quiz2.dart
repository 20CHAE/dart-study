// localhost:8080 으로 접근할 수 있는 서버를 생성하고,
// 크롬 검색창에서 localhost:8080/country=Korea 과 같이 입력했을 때,
// 다음과 같이 출력이 되는 기능을 만드세요.
// [Korea의 수도는 Seoul 입니다.]
// 단, 나라가 입력되지 않은 경우는 다음과 같이 출력되어야 합니다.
// [유효하지 않은 나라를 입력하셨습니다.]

import 'dart:io';
import 'dart:convert';

//서버가 실행되고 있는지 확인
void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print("\$ Server activated in ${ip}:${port}");
}

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
  // HttpServer.bind는 비동기함수라서 await 사용해서 실행기다려줌
  var server = await HttpServer.bind(ip, port);
  //서버가 실행되고 있는지 확인
  printHttpServerActivated(server);

  // 요청 처리하기 -------------------------
  // 요청이 있으면 계속 실행되야하므로 for 사용
  // HttpRequest request in server : 서버안에 있는 요청을 하나씩 가져옴
  // HttpRequest 는 타입유형
  await for (HttpRequest request in server) {
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

        // reponse 작성 -------------------
        request.response
          // 응답상태코드 : ok (잘처리했어)
          ..statusCode = HttpStatus.ok
          // 응답할 데이터의 타입
          ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
          // 응답할 데이터의 길이
          ..headers.contentLength = result.length
          // capital을 화면에 출력해줘 (write썼는데 한글출력안되는오류생겨서 utf8로 인코딩하고 add 써줌
          ..add(result);
      } else {
        // 나라가 map에 없을 때 ----------------

        var result = utf8.encode("유효하지 않은 나라를 입력하셨습니다.");
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
          ..headers.contentLength = result.length
          ..add(result);
      }
    }
    // 종료
    await request.response.close();
  }
}
