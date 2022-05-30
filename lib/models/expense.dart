class Expense{
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title = '';
  double price = 0;

  Expense();

    Expense.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    price = map["price"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "price": price
    };
    return map;
  }

}