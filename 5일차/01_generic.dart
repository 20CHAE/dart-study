// p222 Generic

//Generic
// 한 클래스에서 같은동작 여러자료형을 일 때
// 클래스 이름 뒤에 꺽쇠쓰고 <T> 선언---------- class 클래스명<T>
// 이 클래스는 제네릭을 써서 여러타입에 대응할거야.
// (꼭 T가 아니어도 됨. 영문자는 다 가능)

class NewBoX<T> {
  //인스턴스 변수 선언시 : 자료형 자리에 위에 선언한 문자를 적어준다.
  // 사용자가 입력한 자료형을 따라가겠다는 의미로 다이나믹으로 작성
  late dynamic item;

  // 입력받는 값도 제네릭으로 받을게
  NewBoX(T givenValue) {
    item = givenValue;
  }

  // get set 함수도 제네릭으로 설정하는데
  // 사용자가 입력한 자료형을 따라가겠다는 의미로 다이나믹으로 작성
  dynamic get() {
    return item;
  }

  // 근데 set은 var 또는 다이나믹으로 값 받아라.
  void set(var newItem) {
    item = newItem;
  }
}

void main() {
  var newBox = NewBoX("참돔");
  print(newBox.get());
  newBox.set(1234);
  print(newBox.get());
}
