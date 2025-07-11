// 비동기함수인 sayHello 생성
// 함수 실행 5초 후에 [Hello] 문자열 출력
// 함수 종료 후, main 함수에서 [Hello가 출력되었습니다.]라는 문자열 출력하기

sayHello() async {
  await Future.delayed(Duration(seconds: 5), () => {print("Hello")});
}

//두번째방법
Future<String> sayHello2() async {
  return await Future.delayed(Duration(seconds: 5), () => "Hello");
}

void main() async {
  await sayHello();
  print("Hello가 출력되었습니다.");

  //두번째방법
  var test = await sayHello2();
  print(test);
}
