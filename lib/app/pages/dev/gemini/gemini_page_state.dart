import 'package:x_pr/features/ai/data/models/gemini_req.dart';

sealed class GeminiPageState {}

class GeminiInitState extends GeminiPageState {}

class GeminiLoadedState extends GeminiPageState {
  final GeminiReq req;
  final String res;

  GeminiLoadedState({
    required this.req,
    required this.res,
  });
}