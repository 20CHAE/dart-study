// NoStringException 이라는 에러 클래스를 생성한 후,
// main 함수에 num 이라는 변수를 생성하고, 10 을 넣어주세요.
// 이후 try-catch 문을 통해 num의 타입이 string 이 아닐 경우,
// NoStringException 클래스를 통해 다음의 내용이 출력되게 구현하세요.
// [해당 값은 문자열이 아닙니다.]

// 12.dart참고하여 작성해봐~~~~
// 해결방법 : 다트가 제공해주는 가상클래스Exception 데려와서
// tostring이라는 메서드 오버라이딩해서 사용함
class NoStringException implements Exception {
  // 오버라이드해서 toString가져오기
  @override
  String toString() {
    // TODO: implement toString
    return "해당 값은 문자열이 아닙니다.";
  }
}

void main() {
  var num = 10;

  try {
    if (num.runtimeType != String) {
      // NoStringException 로 에러 토스
      throw NoStringException();
    }
  } catch (error) {
    print(error);
  }
}
