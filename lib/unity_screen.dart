import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityScreen extends StatefulWidget {
  const UnityScreen({Key? key}) : super(key: key);

  @override
  State<UnityScreen> createState() => _UnityScreenState();
}

class _UnityScreenState extends State<UnityScreen> {
  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    final unityWidget = UnityWidget(
      onUnityCreated: _onUnityCreated,
      onUnityMessage: onUnityMessage,
      onUnitySceneLoaded: onUnitySceneLoaded,
      useAndroidViewSurface: true,
      borderRadius: const BorderRadius.all(Radius.circular(70)),
    );
    ;
    return Scaffold(
      body: unityWidget,
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
      ),
    );
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    print('Received scene loaded from unity: ${scene?.name}');
    print('Received scene loaded from unity buildIndex: ${scene?.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    _unityWidgetController = controller;
  }

  void onPressed() {
    _unityWidgetController?.postJsonMessage(
      'MyText',
      'UpdateName',
      {'name': 'AhmadKan'},
    );
  }
}
