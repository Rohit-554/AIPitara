import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeModelService {
  final geminiModel = "gemini-pro";
  late GenerativeModel _geminiModel;
  static String? geminiApiKey = dotenv.env['GEMINIAPIKEY'];

  GenerativeModelService({String model = "gemini-pro"}) {
    try{
      _geminiModel = GenerativeModel(
        model: geminiModel,
        apiKey: geminiApiKey!,
      );
    }catch (e){
      throw ArgumentError('API key is missing');
    }
  }

  Future<String> generateQuestions(String prompt) async {
    try{
      final content = [Content.text(prompt)];
      final response = await _geminiModel.generateContent(content,generationConfig: GenerationConfig(temperature: 0.7, topP: 0.9, topK: 40));
      return response.text!;
    } catch(e){
      return "Something Went Wrong";
    }
  }
}
