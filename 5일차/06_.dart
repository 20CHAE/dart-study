//p.243 동시에 수행할 작업추가하기
// 함수에 async로 작성이 되있고, 이 함수내에서 리턴값을 줘야할때
// 반환값을 Future<> 로 감싸줘야함.
Future<String> serveCustomer() async {
  print("고객: 주문기다리는 중");
  //customerOrder 변수는 simulateCustomerOrder함수 앞에 awit를 자 ㄱ성함
  //시뮤 함수가 동작할때까지 밑에있는 코드를 실행안하겠다.
  var customerOrder = await simulateCustomerOrder();
  // 시뮤함수가 동작하기 전까지 실행하지 않겠다
  print("고객: '$customerOrder' 주문");
  return customerOrder;
}

//반환할 값이 Future라서,
//함수에 async가 안붙어 있어도 Future<>를 감싸줘야한다.
Future<String> simulateCustomerOrder() {
  // 2초뒤 아이스커피
  return Future.delayed(Duration(seconds: 2), () => '아이스커피');
}

void main() async {
  print("main: 시작");
  var customerOrder = await serveCustomer();
  print("main: '$customerOrder' 서빙");
  print("main: 완료");
}
