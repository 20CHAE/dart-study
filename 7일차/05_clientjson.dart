import 'dart:io';
import 'dart:convert';

Future main() async {
  var serverIp = InternetAddress.loopbackIPv4.host;
  var serverPort = 3000;
  var serverPath;

  // 클라이언트 객체 생성
  var httpClient = HttpClient();
  var httpResponseContent;

  // 요청과 응답을 저장할 객체 생성
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  //p385
  // json 콘텐츠 보낸다고 알려줌
  print("|-> POST JSON Format");
  // json으로 전송할 맵객체 생성
  Map jsonContent = {"Korea": "Seoul", "Japan": "Tokyo", "China": "Beijing"};
  // json형태로 인코딩하여 변수에 담아줌
  var content = jsonEncode(jsonContent);

  //p386
  // HTTP POST Request의 주소값을 루트로 설정
  serverPath = "/";
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  // 작성한 정보를 서버에 전송하고 응답을 await 했다가 객체에 저장, 종료.
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);
}

// HTTP Response에서 콘텐츠정보를 출력하는 함수 생성
// 클라이언트한테 응답으로 보내줄거임
void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
