// p228 static
// 해당 클래스 전체가 공유하는 변수.
// 객체가 필요없다.
// 호출시 클래스이름을 적는다.

class NewBoX<T> {
  late dynamic item;

  //static------------------------------------------
  //set을 이용해서 값이 몇번바뀌었는지 저장할 용도로 만든 static변수
  static int changeCount = 0;
  //이클래스를 사용하기로한 객체 에서만 사용할 수 있는 인스턴스변수
  int totalCount = 0;

  NewBoX(T givenValue) {
    item = givenValue;
  }

  dynamic get() {
    return item;
  }

  void set(var newItem) {
    item = newItem;
    changeCount += 1; //인스턴스변수에 1을 더해줘
    totalCount++; //static변수에 1을 더해줘
  }
}

void main() {
  var newBox = NewBoX("참돔");
  var newBox2 = NewBoX("참치");

  print(newBox.get());

  newBox.set(0);
  newBox2.set(1);

  //객체 안에서만 사용가능한 totalCount 변수
  print(newBox.totalCount); //1
  print(newBox2.totalCount); //1

  //static변수 호출시 클래스이름을 불러야함
  print(NewBoX.changeCount); //2 클래스내에서 총 두번 더해졌다.
}
