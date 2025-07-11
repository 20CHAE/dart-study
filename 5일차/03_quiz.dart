// 가게 클래스(shop) 생성
// 인스턴스변수(item) : 파는 물건을 보여줌
// 이 가게에서는 여러가지 물건을 번갈아가며 판매한다.
// 아래 main함수에 맞는 generic 클래스를 작성하라.

class Shop<T> {
  late dynamic item;
  Shop(dynamic givenitem) : item = givenitem;

  //get
  T getSellingItem() {
    return item;
  }

  //set
  void changeItem(dynamic givenitem) {
    item = givenitem;
  }
}

void main() {
  var shop = Shop("아디다스");

  shop.changeItem("청바지");
  print(shop.getSellingItem()); // 출력값 [청바지]
  shop.changeItem(100.1);
  print(shop.getSellingItem()); // 출력값 [100.1]
}
