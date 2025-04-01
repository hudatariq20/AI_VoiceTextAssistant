import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];
  final APIKEY = dotenv.env['API_KEY'];

  Future<String> ChatGPTAPI(String message) async {
    messages.add({'role': 'user', 'message': message});

    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $APIKEY'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": message}
          ]
        }),
      );

      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        return responseData['choices'][0]['message']['content'];
      } else {
        return "Error: Unable to fetch response.";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
