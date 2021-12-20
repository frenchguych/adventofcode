class Synthetizer {
  Map<String, int> data = {};
  String template;
  Synthetizer(this.template) {
    for (int i = 1; i < template.length; i++) {
      var key = template.substring(i - 1, i + 1);
      data[key] = 1 + (data[key] ?? 0);
    }
  }

  void advance(Map<String, String> pairs) {
    Map<String, int> temp = {};
    for (var key in data.keys) {
      var value = data[key]!;
      var element = pairs[key];
      var keyLeft = "${key[0]}$element";
      var keyRight = "$element${key[1]}";
      temp[keyLeft] = value + (temp[keyLeft] ?? 0);
      temp[keyRight] = value + (temp[keyRight] ?? 0);
    }
    data = temp;
  }

  get length {
    return 1 + data.values.fold<int>(0, (previousValue, element) => previousValue + element);
  }

  Map<String, int> get elements {
    Map<String, int> elements = {};
    for (var key in data.keys) {
      var key0 = key[0];
      var key1 = key[1];
      var value = data[key]!;
      elements[key0] = value + (elements[key0] ?? 0);
      elements[key1] = value + (elements[key1] ?? 0);
    }
    elements[template[0]] = elements[template[0]]! + 1;
    elements[template[template.length - 1]] = elements[template[template.length - 1]]! + 1;
    for (var key in elements.keys) {
      elements[key] = elements[key]! ~/ 2;
    }
    return elements;
  }
}

//class Element {
//  String type;
//  Element? next;
//  Element? previous;

//  Element(this.type);
//}

//class Synthetizer {
//  late Element head;

//  Synthetizer(String template) {
//    Element? previousElement;
//    for (int i = 0; i < template.length; i++) {
//      var e = Element(template[i]);
//      if (previousElement != null) {
//        previousElement.next = e;
//        e.previous = previousElement;
//      } else {
//        head = e;
//      }
//      previousElement = e;
//    }
//  }

//  get length {
//    var e = head;
//    var length = 1;
//    while (e.next != null) {
//      length += 1;
//      e = e.next!;
//    }

//    return length;
//  }

//  Map<String, int> get elements {
//    Map<String, int> elements = {};
//    var e = head;
//    while (true) {
//      elements[e.type] = 1 + (elements[e.type] ?? 0);
//      if (e.next == null) {
//        break;
//      }
//      e = e.next!;
//    }
//    return elements;
//  }

//  advance(Map<String, String> pairs) {
//    var a = head;
//    var b = a.next;
//    while (b != null) {
//      var key = "${a.type}${b.type}";
//      var type = pairs[key]!;
//      var e = Element(type);
//      e.previous = a;
//      a.next = e;
//      e.next = b;
//      b.previous = e;
//      var c = b;
//      b = b.next;
//      a = c;
//    }
//  }

//  @override
//  String toString() {
//    var output = "";
//    var e = head;
//    while (true) {
//      output = "$output${e.type}";
//      if (e.next == null) {
//        break;
//      }
//      e = e.next!;
//    }
//    return output;
//  }
//}
