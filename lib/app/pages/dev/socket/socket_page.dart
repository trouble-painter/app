import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/socket/socket_page_model.dart';
import 'package:x_pr/app/pages/dev/socket/socket_page_state.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class SocketPage extends StatelessWidget {
  const SocketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SocketPageModel.new,
      state: (ref, prevState) => SocketInitState(),
      initState: (ref, viewModel) => viewModel.connect(),
      builder: (ref, viewModel, state) => Scaffold(
        appBar: AppBar(
          title: const Text("Socket"),
        ),
        body: SafeArea(
          child: switch (state) {
            SocketDisconnectedState() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Button(
                      iconWidget: (color, isInactive) => Icon(
                        Icons.refresh,
                        color: color,
                      ),
                      text: "Disconnected",
                      onPressed: viewModel.connect,
                    ),
                  ),
                ],
              ),
            SocketConnectedState(
              responseList: final responseList,
            ) =>
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: responseList.map((res) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: context.color.hint,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(
                              bottom: 8,
                              left: 8,
                              right: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Res : $res"),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const Divider(),
                  Button(
                    width: double.infinity,
                    text: "Create Room",
                    margin: const EdgeInsets.all(16),
                    onPressed: () => viewModel.enterRoom(),
                  ),
                  Button(
                    width: double.infinity,
                    text: "Join Room",
                    margin: const EdgeInsets.all(16).copyWith(top: 0),
                    onPressed: () => viewModel.enterRoom("VADSFA"),
                  ),
                ],
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
    );
  }
}
