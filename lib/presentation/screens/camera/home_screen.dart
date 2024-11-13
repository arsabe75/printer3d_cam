import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class HomeScreen extends HookWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isRunning = useState(true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Printer 3D Cam'),
        actions: [
          IconButton(
            onPressed: () {
              isRunning.value = !isRunning.value;
            },
            icon: Icon(isRunning.value
                ? Icons.camera_alt_rounded
                : Icons.camera_alt_outlined),
          ),
        ],
      ),
      body: Center(
        child: Mjpeg(
          fit: BoxFit.cover,
          isLive: isRunning.value,
          error: (context, error, stack) {
            //print(error);
            //print(stack);
            return Text(error.toString(),
                style: const TextStyle(color: Colors.red));
          },
          stream:
              'http://192.168.0.34:8081/video.mjpg', //'http://192.168.1.37:8081',
        ),
      ),
    );
  }
}
