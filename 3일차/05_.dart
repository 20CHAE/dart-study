enum Color { red, green, blue }

//------------------------------------

//p168 조건적 표현
// A ? B : C
// a가 맞으면 b 실행, 아니면 c 실행

void main() {
  List list = [1, 2, 3];

  //리스트가 비어있는지 확인하는 if문
  if (list.isEmpty) {
    print("list is empty");
  } else {
    print("list is not empty");
  }
  //위 문장을 조건적 표현으로 더 간단하게 만들어 보자
  list.isEmpty ? print("list is empty") : print("not empty");

  // 중복사용 가능
  // but 길어지면 복잡해지므로 if문이 더 낫다.

  list.isEmpty
      ? print("list is empty")
      : list.first != 1
      ? print("첫번째 값은 1")
      : print("첫번째 값는 1이 아님");

  //p169 비트처리 연산자
  //수업에서 패스함

  //p171 16진법
  // 0~f
  print("Hexa Decimal Presentation");
  num var1 = 0x01;
  num var2 = 0xff;
  print(var1); //1
  print(var2); //255

  //p172 지수표현패스

  //문자열을 숫자로 변환
  num varI = int.parse('1');
  num varD = double.parse('1.1');
  print(varI);
  print(varD);

  //enum 나열형 데이터 이해하기
  //void함수 밖에 Color라는 함수생성함 (상단 참고)
  print(Color.values);
  Color chColor = Color.red;
  print(chColor);
  // ??????? 이해못함

  //p174 null-safety
  //책 읽어볼 것.
}
