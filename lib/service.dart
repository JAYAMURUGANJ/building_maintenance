import 'package:http/http.dart' as http;
import 'dart:convert';
import 'complaint.dart';

Future<List<Complaint>> fetchComplaintDetails() async {
  final response = await http.get(Uri.parse(
      'https://storage.googleapis.com/s3.codeapprun.io/userassets/jayamurugan/GumGlftwyZcomplaint.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. ProfileInfo.fromJson(json.decode(response.body))
    // Iterable l = json.decode(response.body);

    List<Complaint> list = List<Complaint>.from(
        (json.decode(response.body) as List).map((i) => Complaint.fromJson(i)));
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
