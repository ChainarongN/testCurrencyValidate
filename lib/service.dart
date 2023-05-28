import 'package:http/http.dart' as http;

class Service {
  Service._internal();
  static final Service _instance = Service._internal();
  factory Service() => _instance;

  Future getMethod(
    String? url,
  ) async {
    try {
      var response = await http.get(
        Uri.parse(url!),
      );
      // print(response.body);
      return response.body;
    } catch (e, trace) {
      print('ErrorFromAPIservice:: $e');
      print('ErrorFromAPIservice:: $trace');
    }
  }
}
