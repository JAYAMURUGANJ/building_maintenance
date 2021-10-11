import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/complaint.dart';

class UserComplaints {
  // ignore: missing_return

  static Future<List<Complaint>> getComplaints() async {
    var url = Uri.parse(
      "https://rtionline.tn.gov.in/sscsr/sscsr/complaint.php",
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var listofdata = response.body;
      List<Complaint> list = parseUsers(listofdata);

      return list;
    } else {
      throw Exception("Error");
    }
  }

  static List<Complaint> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Complaint>((json) => Complaint.fromJson(json)).toList();
  }
}
