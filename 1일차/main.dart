void main () {
  //정수형 변수 선언
  int num1 = 1;

  //실수형 변수 선언
  double num2 = 3.14;

  //값을 변경할 수 없는 변수
  const int num3 = 3;
  final double num4;
  num4 = 3.14;
  
  //값을 유동적으로 변경가능한 변수
  dynamic num5 = 5;
  num5 = 4.3;


  //연산자 + - * / ~/ % -= += /= *= -- ++

  //문자출력
  print("""
이대로
출력하기
""");

  print("$num5 를 출력하기");

  //들여쓰기
  print("123\n456");

  //변수에 들여써서 저장해도됨
//   string num6 = """
// 먼저 들여써서
// 저장하기
// """;
 
//   print(num6);

}