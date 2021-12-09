import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashFinder {
  final String secretKey;

  HashFinder(this.secretKey);

  _findHash(int difficulty) {
    var prefix = "0" * difficulty;

    var i = 1;

    while (true) {
      var x = md5.convert(utf8.encode("$secretKey$i")).toString();
      if (x.startsWith(prefix)) {
        break;
      }
      i += 1;
    }

    return i;
  }

  int get part1 {
    return _findHash(5);
  }

  int get part2 {
    return _findHash(6);
  }
}
