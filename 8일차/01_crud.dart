//p392 rest api기반 crud 개발하기
// rest라는 http통신 사용법 배움
// rest : http프로토콜의 사용법을 정한 일종의 묵시적 합의.
// 세부적인 지침이 아닌 철학이다.
// 회사마다 http를 통한 입출력값을 정한 API를만들어 rest에 부합하는 형태로 구현한다.
// 이를 restful API라고 함.

//[rest특징]
//1.json포맷으로 데이터주고받는다.
//2.crud 원칙에 따라서 메서드를 사용한다.
// create (post) Read (get) Update (put) Delete (delete)
//3.웹주소인 url을 /{기능이름}/{key값} 의 형태로 작성하여 기능을 요청하거나 key를 식별한다.

//p400

import 'dart:io';
import 'dart:convert';

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print("\$ Server activated in ${ip}:${port}");
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

//p401 서버에서 HTTP Request를 클라이언트에게 전달한는용도
// db : rest 방식으로 request받았을때, crud 진행후 결과를 담을 변수
//content : 응답으로 보내줄 값
void printAndSendHttpResponse(var db, var request, var content) async {
  print("\$ $content \n curren DB : $db");
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);

  await request.response.close();
}

// 타입이 정해져있다면 함수넣는값 적어줄때
// 타입도 같이 적는게좋다. 그래야 자동완성 잘된다.

//p404 CREATE작업함수
void createDB(Map db, HttpRequest request) async {
  //받은 요청을 utf8로 디코더(해독)해서 저장
  var content = await utf8.decoder.bind(request).join();
  // jason데이터를 맵객체로 변환함
  var transaction = jsonDecode(content) as Map;
  // 맵에 사용할 키와 밸류 변수 선언
  var key, value;

  print("\> content   : $content");
  //map객체.forEach((k,v) {}) : 맵안의 값에 하나씩 접근하겠다.
  //k,v : 트랙잭션이 갖고 있는 키와 밸류.
  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  // db가 해당 키값을 갖고 있지 않다면
  if (db.containsKey(key) == false) {
    db[key] = value;
    content = "Success < $transaction created >";
  } else {
    content = "Fail <$key already exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

//p405 READ작업함수
void readDB(Map db, HttpRequest request) async {
  //pathSegment : / 슬래시로 port뒷주소를 분리한다.
  // pathSegment.last : 주소 마지막 슬래시 뒷부분
  var key = request.uri.pathSegments.last;
  var content, transaction;

  // key 값 갖고 있다면
  if (db.containsKey(key) == true) {
    transaction = {};
    transaction[key] = db[key];
    content = "Success < $transaction retrieved >";
  } else {
    // key 안갖고 있다면
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

//p406 UPDATE작업함수
void updateDB(Map db, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content  : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  // key 있는지 확인하고 값 바꿔줘
  if (db.containsKey(key) == true) {
    db[key] = value;
    content = "Success < $transaction updated >";
  } else {
    content = "Fail < $key non-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

// p407 DELETE작업함수
void deleteDB(Map db, HttpRequest request) async {
  // 주소 마지막 문자열을 key로 변수선언
  var key = request.uri.pathSegments.last;
  var content, value;

  // key가 있다면 키삭제
  if (db.containsKey(key) == true) {
    value = db[key];
    db.remove(key);
    content = "Success < $value delete >";
  } else {
    // key가 없다면
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

//p402 메인함수 -----------------------------
Future main() async {
  //맵 변수 선언 : 키 다이나믹, 밸류 다이나믹
  var db = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);
  //어떤 포트 쓰는지 확인
  printHttpServerActivated(server);

  // for로 무한반복 : 서버에 요청이 들어오면 처리해줘
  await for (HttpRequest request in server) {
    //p403
    // 요청한 웹주소에 문자열 /api/가 있냐
    if (request.uri.path.contains('/api/') == true) {
      // 요청정보 프린트해줘
      printHttpRequestInfo(request);

      try {
        // request의 메서드에 맞춰 실행해줘
        switch (request.method) {
          case 'POST':
            createDB(db, request);
            break;
          case 'GET':
            readDB(db, request);
            break;
          case 'PUT':
            updateDB(db, request);
            break;
          case 'DELETE':
            deleteDB(db, request);
            break;
          default: //그외 메서드 예외처리
            print("\$ Unsupported http method");
        }
      } catch (err) {
        print("\$ Exception in http request processing");
      }
    } else {
      printAndSendHttpResponse(
        db,
        request,
        "${request.method} {ERROR: Unsupported API}",
      );
    }
  }
}
