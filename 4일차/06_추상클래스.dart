//p213 추상클래스
//여러클래스들이 공통으로 가지고 있는 기능이지만
//각 클래스들마다 미세하게 작동이 다를 때
// 추상적으로 기능을 정의해줌

// 추상클래스 만들기
//앞에 abstract를 적는다
abstract class Rectangle {
  int cx = 0, cy = 0;

  // 추상클래스는 함수선언만 가능
  // 객체를 만들 수 없다.
  void draw() {} // '그리기' 기능 만듦
}

class Circle implements Rectangle {
  //오버라이드하고 (상속인 extends와 다른 점 : 오버라이드해서 적어줘야 함)
  @override
  int cx = 0, cy = 0;

  //인스턴스 변수 생성
  late int radius;

  //오버라이드
  @override
  void draw() {
    print(" 반지름 $radius인 원을 그립니다.");
  }

  //생성자
  Circle([int givenRadius = 1]) : radius = givenRadius;
}

class Square implements Rectangle {
  //오버라이드
  @override
  int cx = 0, cy = 0;

  //변수 생성
  late int garo, sero;

  //오버라이드
  @override
  void draw() {
    print("가로 $garo 세로 $sero 인 사각형을 그립니다.");
  }

  //생성자
  Square([int givensero = 1, int givengaro = 1])
    : sero = givensero,
      garo = givengaro;
}

void main() {
  var circle = Circle(6);
  var square = Square(12, 3);
  // 추상클래스는 실체를 가질 수 없다.
  // var r = Rectangle(); 오류나는 코드임.

  circle.draw();
  square.draw();
}
