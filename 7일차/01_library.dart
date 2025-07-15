//p307 표준라이브러리 활용하기

//p312

import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'dart:core';

//p316비동기=============================================
Future<int> async1() async {
  print("async1() : 1 second left");
  await Future.delayed(Duration(seconds: 1));
  print("async1 : finished");
  return 10;
}

Future<int> async2() async {
  print("async2() : 2 second left");
  await Future.delayed(Duration(seconds: 1));
  print("async2() : 1 second left");
  await Future.delayed(Duration(seconds: 1));
  print("async2 : finished");
  return 20;
}

Future<int> async3() async {
  print("async3() : 3 second left");
  await Future.delayed(Duration(seconds: 1));
  print("async3() : 2 second left");
  await Future.delayed(Duration(seconds: 1));
  print("async3() : 1 second left");
  await Future.delayed(Duration(seconds: 1));
  print("async3 : finished");
  return 30;
}

//===================================================
//

void main() {
  // List<String> fruits = ['사과는 빨개', '   바나나   ', '망고'];
  // print("망고 in list? : ${fruits.contains("망고")}");
  // print("사과로 시작? : ${fruits[0].startsWith('사과')}");
  // print("빨개 로 끝나? : ${fruits[0].endsWith("빨개")}");
  // print("인덱스 of 빨개 : ${fruits[0].indexOf("빨개")}");
  // print("앞뒤여백 trim '${fruits[1]}' : ${fruits[1].trim()}");

  // //p314 platform class
  // // native환경 (윈도우, macOS)에서 우리가 만든 프로그램이 바로 실행될때 필요한 기능 제공
  // String os = Platform.operatingSystem; //컴퓨터운영체제 정보 반환
  // String path = Platform.script.toFilePath(); //사용중인 파일의 경로 반환
  // print("os : $os");
  // print("path : $path");

  // //p315 Math 라이브러리
  // //사칙연산, 수학계산 지원
  // print("max(2,4) : ${max(2, 4)}"); //최대값 리턴
  // print("min(2,4) : ${min(2, 4)}"); //최소값 리턴
  // print("e : {$e}"); //지수e
  // print("pi : {$pi}"); //파이값

  //
  //
  //p316 비동기처리 라이브러리
  // import 'dart:core';
  // import 'dart:async';

  var t1 = DateTime.now();
  // wait 세함수가 동작할 때까지기다려라
  // then 그다음에 실행해라
  Future.wait([async1(), async2(), async3()])
      .then((List<int> nums) {
        var t2 = DateTime.now();
        // reduce
        var sum = nums.reduce((curr, next) => curr + next);
        // difference : t1과 t2의 시간차 계산
        print("sum : $sum < Time : ${t2.difference(t1)} >");
      })
      // 실행하다 안되면 에러출력해라
      .catchError(print);
}
