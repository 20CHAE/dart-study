void printStar(var item) {
  print("\u{2605} $item \u{2605}");
}

//---------------------------------------------

void main() {
  //유니코드
  //중괄호 안에는 16진수가 표기된다. (0~F)
  // 유니코드 외에도 아스키, utf 등이 있다.

  //유니코드 한글
  print("\u{AC00}"); //가
  //유니코드 알파벳 이모지
  Map emoji = {
    "A": "\u{0041}",
    "a": "\u{0064}",
    "clap": "\u{1f44f}",
    "smile": "\u{1f642}",
    "star": "\u{2605}",
  };
  print(emoji);

  //p166 cascade
  List list = [];
  list
    ..addAll([2, 1])
    ..add(0)
    ..sort((a, b) => a.compareTo(b)); //sort명령어를 자세하게 풀어놓은 것임.
  print(list);

  //p167 forEach 메서드
  // 페이지 상단에 foreach메서드 예시를 위한 함수생성
  list.forEach(printStar);
  //의미는 아래와 동일하다
  list.forEach((item) => {printStar(item)});

  // 중첩함수 p168
  void printSmile(var item) {
    print("\u{1f642} $item \u{1f642}");
  }
  // ???????
}
