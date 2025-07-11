// p237~p242까지
// 이해못했음

doBG(int time, var jobEnd) {
  if (time > 0) {
    print("$time 초 남았습니다.");
    Future.delayed(Duration(seconds: 1), () => doBG(time - 1, jobEnd));
  } else {
    print("밥이 준비되었습니다.");
    jobEnd.activated = true;
  }
}

class Flag {
  late bool _flag;

  Flag(bool givenFlag) : _flag = givenFlag;
  bool get activated => _flag;
  set activated(bool givenFlag) => _flag = givenFlag;
}

void main() async {
  var finished = Flag(false);
  while (finished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }
  print("주문하기");
  await doBG(5, finished);
  print("먹기");
}
