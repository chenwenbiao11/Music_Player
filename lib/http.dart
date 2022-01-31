import 'package:http/http.dart' as http;

void main(List<String> args) {
  String data = http.get("localhost:3000").toString();
  print(data);
}

void checkServerState() {
  String State = http.get("localhost:3000").toString();
}
