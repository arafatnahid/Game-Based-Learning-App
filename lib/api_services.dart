import 'dart:convert';

import 'package:http/http.dart' as http;

var link = "http://localhost:3000/category/history";

getQuiz() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    print("data is loaded");
    print(res);
    return data;
  }
}
