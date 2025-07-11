//p265 자체 에러 생성하기

// NegativeDivisorException라는 클래스를 생성할건데-------------------
// Exception이라는 가상클래스를 참조할거야 (다트에서 제공하는 가상클래스임)
class NegativeDivisorException implements Exception {
  @override
  String toString() {
    return "0으로 숫자를 나눌 수 없습니다.";
  }
}

int calc(int a, int b) {
  int result = 0;

  if (result == 0) {
    // throw : 강제로 에러를 만들어서 코드진행을 막는다.
    // result가 0이면 에러를 만들어라.
    throw NegativeDivisorException();
  } else {
    result = a ~/ b;
  }

  return result;
}

void main() {
  int a = 1;
  int b = 0;
  int result = 0;

  try {
    result = calc(a, b);
    // 강제로 만든 에러도 처리할 수 있도록 예외처리 만들어준다.----------------------
  } on NegativeDivisorException {
    print("on NegativeDivisorException : result가 0입니다.");
    b = 1;
    print("1로 바꾸고 재시도");
    result = a ~/ b;
  } finally {
    print("결과는 $result 입니다.");
  }
}
