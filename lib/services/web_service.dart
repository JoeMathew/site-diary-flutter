import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:site_diary_app/models/site_diary_model.dart';

class WebService {
  WebService(this.baseUrl);
  final String baseUrl;

  Future<List<String>> uploadPhotos(List<String> photoPaths) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/photo-upload'),
    );

    for (final photoPath in photoPaths) {
      final file = File(photoPath);
      final part = await http.MultipartFile.fromPath('photos[]', file.path);
      request.files.add(part);
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final responseJson = json.decode(responseBody);
      return (responseJson['photoUrls'] as List<dynamic>)
          .map((item) => item.toString())
          .toList();
    } else {
      throw Exception('Failed to upload photos: ${response.reasonPhrase}');
    }
  }

  Future<void> submitDiary(SiteDiaryModel diary) async {
    final requestBody = json.encode(diary.toJson());

    final response = await http.post(
      Uri.parse('$baseUrl/submit-diary'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to submit diary: ${response.reasonPhrase}');
    }
  }
}
