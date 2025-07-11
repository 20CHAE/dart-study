//p262

// calc 함수 생성 ----------------------
int calc(int a, int b) {
  int result = 0;

  // 함수 내에서 발생한 에러는 자체 정리하도록
  // catch 문을 main에서 함수 안으로 옮겨주었다.
  try {
    result = a ~/ b;
  } on UnsupportedError {
    print("on UnsupportedError: num2 is 0");
    b = 1;
    print("on UnsupportedError : num2를 1로 바꾸고 재실행");
    result = a ~/ b;
    print("result is $result");
  } catch (error) {
    //rethrow--------------
    // 함수를 호출한 쪽으로 에러를 다시 넘긴다.
    rethrow;
  }
  return result;
}

void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  try {
    result = calc(num1, num2);
  } finally {
    print("결과는 $result 입니다.");
  }
}
