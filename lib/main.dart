import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Printer 3D Cam',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isRunning = useState(true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Printer 3D Cam'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Mjpeg(
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
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  isRunning.value = !isRunning.value;
                },
                child: const Text('Toggle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                            appBar: AppBar(),
                          )));
                },
                child: const Text('Push new route'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
