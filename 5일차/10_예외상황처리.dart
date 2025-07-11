//p251 try catch 예외상황처리
//에러명을 확인해볼 수 있다.
//에러 종류에 따라 대처를 다르게 할 수 있다.

void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  //try : 먼저 실행해봐
  //catch : try도중 (에러) 캐치하면 {동작} 실행해

  // 문법 : try {} catch(error다른이름써도됨) {동작}
  try {
    result = num1 ~/ num2;
  } catch (error) {
    //IntegerDivisionByZeroException : 정수는 0으로 나눌 수 없다는 에러가 표시됨
    print("catch : $error");
    num2 = 1;
    print("catch : num2를 1로 바꾸고 재실행");
    result = num1 ~/ num2;
  }
  print("result is $result");

  //p256 on UnsupportedError------------------------
  // 특정한 에러를 지정하여 사용
  // 사용법 : on 에러이름
  try {
    result = num1 ~/ num2;
  } on UnsupportedError {
    print("on UnsupportedError: num2 is 0");
    num2 = 1;
    print("on UnsupportedError : num2를 1로 바꾸고 재실행");
    result = num1 ~/ num2;
    print("result is $result");
  } catch (error) {
    // p.258 예측불가능한 에러 처리
    print("catch : 알 수 없는 에러 발생");
  } finally {
    //p259 finally-----------------------------
    // try on catch 모두를 써도 결국엔 finally로 마무리한다!
    print("결과는 $result 입니다.");
  }
}
