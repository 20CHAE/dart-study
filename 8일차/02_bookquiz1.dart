// 현재 01_crud.dart에 있는 파일에서 updateDB부분은 수정할 데이터가 들어가있는 값을
//전부 body에 담아서 사용하고 있다.
//수정할 데이터의 key값을 요청의 마지막 부분에 담아서 수정하고 싶다.
// ex) PUT 127.0.0.1:4040/api/0001

// 이 방식을 이용해서 key 값을 조회하고, body 부분에는 다음과 같이 입력을 했을 때
// key에 있는 데이터가 수정이 될 수 있게 하고자 합니다.
// body에 들어갈 값 : { "data": "Cheongju" }
// 현재 존재하는 updateDB 를 위에 작성한 내용대로 실행했을 때 값이 수정되도록 변경해보세요.

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
  // 주소 마지막문자를 변수 선언
  var lastString = request.uri.pathSegments.last;
  var key, value;

  // map 에서 우리가 어떻게 이 키가 존재하는지 확인할 수 있을까?
  // containsKey -> 키가 존재하는지에 대한 여부만 반환을 해줘요 ( true, false )
  // containsKey 가 true다. = key 가 뭔지 확인할 수 있다.

  // print("키 :  ${transaction.keys}");
  // for ( key in transaction.keys) {
  // 키가 data 일 때만 추가한다.
  // }
  print("\> content  : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  // lastString이 맵에 있는지 확인하고
  if (db.containsKey(lastString) == true) {
    db[lastString] = value;
    // // 맵에 있다면 json의 키값이 date인지 확인
    // if (transaction.keys == "data") {
    //   // value 저장해줘
    //   db[lastString] = value;
    //   content = "Success < $transaction updated >";
    // } else {
    //   content = "Fail < $key is not correct world >";
    // }
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
