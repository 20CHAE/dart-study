// p340 http서버와 클라이언트 개발

// p348
import 'dart:io';

void main() async {
  //서버가 사용할 ip과 port주소
  //지금은 서버와 클라이언트가 동일하므로 다트에서 제공하는 내부간 통신을 위한 인터넷주소를 사용한다. (127.0.0.1)
  var ip = InternetAddress.loopbackIPv4;
  var port = 4040;

  //입력한 ip와 port로 서버를 만듦
  var server = await HttpServer.bind(ip, port);

  //주소확인
  print("\$ server activated = ${server.address.address}:${server.port}.");

  //p350
  // server에 들어온 request가 있다면 반복하여 실행해줘
  await for (HttpRequest request in server) {
    // try {} catch (error) {}
    try {
      //request.uri.path : url에서 http://127.0.0.1:4040/ 를 제와한 다음문자열
      // uri: 사용자가 보낸요청의 주소, path : 주소에 대한 경로(ip주소와 포트번호를 제외한 다음문자열)
      print("\$ http request for ${request.uri.path} at (${DateTime.now()}).");

      //p352
      // 주소다음에 '/'이것만 있다면
      if (request.uri.path == '/') {
        print("\$ http response is 'hello, world!'.");
        print("\$ send '200 ok'.");

        // 요청에 대한 응답을 줘
        request.response
          // 사람이 알아보기 좋은 코드로 ok를 줘
          ..statusCode = HttpStatus.ok
          ..write("Hello, world!"); //f12의 응답창에서 확인가능

        //p353
        // 주소다음에 '/add'라고 적혀있다면
      } else if (request.uri.path.contains('/add')) {
        print("\$ http response is result of 'add' operation.");
        print("\$ send '200 ok'.");

        var varList = request.uri.path.split(",");
        var result = int.parse(varList[1]) + int.parse(varList[2]);

        request.response
          ..statusCode = HttpStatus.ok
          ..write("${varList[1]} + ${varList[2]} = $result");

        //p355
        //주소 뒤의 텍스트에 문자열이 있냐 확인
      } else if (await File(request.uri.path.substring(1)).exists() == true) {
        print("\$ http response is '${request.uri.path}' file transfer.");
        print("\$ send '200 ok'.");

        //주소 뒤의 텍스트에서  substring(1) : 첫번째 문자열 제거하고 File객체 생성
        var file = File(request.uri.path.substring(1));
        //file의 내용을 문자열로 읽어들임
        var fileContent = await file.readAsString();

        //요청에 대한 응답을 줘
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
          ..write(fileContent);
      }
      //p356
      // 서버가 지원하지 않은 주소정보를 받을때
      else {
        print("\$ unsupported uri.");
        print("\$ send '404 not-found'.");

        request.response
          //notfound 상수 값을 필드에 저장
          ..statusCode = HttpStatus.notFound
          // 웹브라우저 화면에 띄워줘
          ..write("Unsupported URI.");
      }
      //p353
      // close하고 클라이언트에게 보내줘
      await request.response.close();
      //p351
      //처리중에 에러 발생시 에러코드 띄워줘
    } catch (error) {
      print("\$ exception in http request processing.");
    }
  }
}
