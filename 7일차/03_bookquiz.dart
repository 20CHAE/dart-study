// 강사님과 구구단 만들어보기

import 'dart:io';

Future main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 3000;
  var server = await HttpServer.bind(ip, port);
  print("\$ server activated = ${server.address.address}:${server.port}.");

  await for (HttpRequest request in server) {
    try {
      // http://127.0.0.1:3000/dan 이라면
      if (request.uri.path.contains('/dan')) {
        //기능 구현
        var varList = request.uri.path.split(",");
        var dan = int.parse(varList[1]);
        var result;

        // 1~9를 곱하는 기능 write
        request.response.statusCode = HttpStatus.ok;
        request.response.write("""
$dan x 1 = ${dan * 1}
$dan x 2 = ${dan * 2}
$dan x 3 = ${dan * 3}
$dan x 4 = ${dan * 4}
$dan x 5 = ${dan * 5}
$dan x 6 = ${dan * 6}
$dan x 7 = ${dan * 7}
""");
      }

      // 사용자의 요청에 응답을 했으니 종료할게
      await request.response.close();
    } catch (error) {
      print("에러 발생");
    }
  }
}
