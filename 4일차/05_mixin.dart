// p205 mixin
// 클래스 내부에서 사용하는 부속품 개념의 클래스

class Integer {
  late int _value;

  // 생성자
  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  int get() {
    return _value;
  }

  void set(int getValue) {
    _value = getValue;
  }

  String get returnString => "$_value";
  set changeInteger(int givenValue) => _value = givenValue;

  //
  String get asString => "$_value";
}

// mixin 사용할 수 있게 'with ActivationFlag' 써줌 -------------------
class newInteger extends Integer with ActivationFlag {
  //리스트 생성
  List<int> _list = [];
  //생성자
  newInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  //mixin 사용하기 ------------------------
  @override
  void set(int givenValue) {
    //액티베이티드가 true면 (mixin에 _flag = true인 상태임)
    if (activated == true) {
      //리스트에 값 추가해줘
      _list.add(_value);
      print("set함수 실행함, 현재 저장된결과는 $_list 임");
    } else {
      print("set함수 실행 안함");
    }

    super.set(givenValue);
  }

  //getter함수 생성
  @override
  String get asString => "현재 값 : $_value, 기존에 지정했던 값들 : $_list";

  // getOld
  List getOld() {
    return _list;
  }
}

// mixin ----------------------------------
//일부클래스에만 사용하고 싶다면 아래처럼 씀
// 상위클래스에 on 해줬음
//mixin ActivationFlag on Integer {
mixin ActivationFlag {
  bool _flag = true;

  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}

void main() {
  var num1 = newInteger();
  num1.set(2);
  num1.set(4);

  num1.activated = false;

  num1.set(6);
  num1.set(8);
}
