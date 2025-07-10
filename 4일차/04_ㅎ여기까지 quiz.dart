// 1.Integer 클래스를 생성하고
// 인스턴스변수(val) 생성
// 2.Integer 클래스의 생성자는 203페이지를 참고하여 작성
// 3.Integer 클래스에서 인스턴스변수val을 return하는 함수(get)와 값을 변경하는 함수(set)생성
// 4.Integer 클래스를 extends하는 클래스(GoodInteger) 생성
// 5. GoodInteger 클래스에서 list형 인스턴스변수(goodlist) 생성
// 6.Integer 클래스에 존재하는 set 함수를 override하여,
// 값 변경할 때마다 goodlist에 저장하는 함수 생성
// 7.goodlist의 값들을 return하는 함수 생성

//----------------------------------------------------------

// 1.Integer 클래스를 생성하고
class Integer {
  // 인스턴스변수(val) 생성
  late int val;

  // 2.Integer 클래스의 생성자는 203페이지를 참고하여 작성
  Integer([int givenValue = 0]) : val = givenValue;

  // 3.인스턴스변수val을 return하는 함수(get) 생성
  //(get으로 해줌)
  int get() {
    return val;
  }

  //(getter로 해줌)
  int get getget => val;

  //값을 변경하는 함수(set)생성
  void set(int givenValue) {
    val = givenValue;
  }

  set setset(int givenValue) => val = givenValue;
}

// 4.Integer 클래스를 extends하는 클래스(GoodInteger) 생성
class GoodInteger extends Integer {
  // 5. GoodInteger 클래스에서 list형 인스턴스변수(goodlist) 생성
  late List goodlist = [];

  //(생성자 만듦) 만들어줘야됨
  GoodInteger([int givenValue = 0]) {
    val = givenValue;
  }

  // 6.Integer 클래스에 존재하는 set 함수를 override하여,
  @override
  void set(int givenValue) {
    // 값 변경할 때마다 goodlist에 저장하는 함수 생성
    goodlist.add(val);
    super.setset = givenValue;
  }

  // 7.goodlist의 값들을 return하는 함수 생성
  List returnList() {
    return goodlist;
  }
}

void main() {
  var num1 = Integer(2);
  print(num1.get()); //get방법
  print(num1.getget); //getter방법
  num1.setset = 5;
  print(num1.get());
}

////setter로 만든 함수를 상속받았을때 이름에서 오류남..!!!!!!!!!!!
