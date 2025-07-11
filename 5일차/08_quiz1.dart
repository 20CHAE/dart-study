// Future.Delayed 함수를 사용
//Delayed 함수에서 [10초 뒤에 실행된 코드입니다.] 출력
// 출력결과 :
//안녕하세요
//10초 뒤에 실행된 코드입니다.
//안녕하세요

void main() async {
  print("안녕하세요.1");
  await Future.delayed(Duration(seconds: 10), () => print("10초 뒤에 실행된 코드입니다."));
  print("안녕하세요.2");
}
