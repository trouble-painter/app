import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/gemini/gemini_page_model.dart';
import 'package:x_pr/app/pages/dev/gemini/gemini_page_state.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/view/base_view.dart';

class GeminiPage extends StatelessWidget {
  const GeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GeminiPageModel.new,
      state: (ref, prevState) => GeminiInitState(),
      builder: (ref, viewModel, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Gemini"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: switch (state) {
                      GeminiInitState() =>
                        const Center(child: Text("No Result")),
                      GeminiLoadedState(
                        req: final req,
                        res: final res,
                      ) =>
                        Column(
                          children: [
                            Text(req.prompt),
                            if (req.image != null)
                              Padding(
                                padding: const EdgeInsets.all(60),
                                child: Image.memory(req.image!.data),
                              ),
                            const Divider(),
                            const SizedBox(height: 30),
                            Text("Gemini : $res"),
                          ],
                        ),
                    },
                  ),
                  Button(
                    text: "Request",
                    onPressed: viewModel.call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
