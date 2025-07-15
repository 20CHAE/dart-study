// localhost:8080 으로 접근할 수 있는 서버를 생성하고,
// 크롬 검색창에서 localhost:8080/country=Korea 과 같이 입력했을 때,
// 다음과 같이 출력이 되는 기능을 만드세요.
// [Korea의 수도는 Seoul 입니다.]
// 단, 수도가 입력되지 않은 경우는 다음과 같이 출력되어야 합니다.
// [유효하지 않은 나라를 입력하셨습니다.]

import 'dart:convert';
import 'dart:io';

Future main() async {
  // 접속할 서버 설정
  var ip = InternetAddress.loopbackIPv4.host;
  var port = 3000;
  var server = await HttpServer.bind(ip, port);
  var serverPath;

  // 클라이언트 객체 생성
  var httpClient = HttpClient();
  var httpResponseContent;

  // 요청과 응답을 저장할 객체 생성
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  // 서버한테 확인해달라고 요청하기 get
  print("|-> get");
  serverPath = "capital=Korea"; //모르니까 일단 써봄
  httpRequest = await httpClient.get(ip, port, serverPath);

  // 응답받아서 출력
}
