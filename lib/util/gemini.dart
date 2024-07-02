import 'package:http/http.dart' as http;
import 'dart:convert';

class GeminiService {
  final String proxyUrl = 'https://proxy-github-izk9fnc45-jeevs-projects.vercel.app/generateContent';
   // Replace with your actual Vercel deployment URL

  Future<String> getHelpNoteForTask(String task) async {
    final response = await http.post(
      Uri.parse(proxyUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'task': task,
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['content'] ?? 'No content available';
    } else {
      throw Exception('Failed to load help note');
    }
  }
}
