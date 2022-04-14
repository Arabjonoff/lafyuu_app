void main() {
  List<int> a = [3, 4, 5, 3, 4, 6];
  List<List<int>> data = [];
  for (int i = 0; i < a.length; i++) {
    bool k = true;
    for (int j = 0; j < data.length; j++) {
      if (data[j].first == a[i]) {
        data[j].add(a[i]);
        k = false;
        break;
      }
    }
    if (k) {
      List<int> list = [];
      list.add(a[i]);
      data.add(list);
    }
  }

  print(data);
}
