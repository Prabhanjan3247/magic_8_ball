import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Magic8BallApp());
}

class Magic8BallApp extends StatelessWidget {
  const Magic8BallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic 8 Ball',
      home: BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => BallPageState();
}

class BallPageState extends State<BallPage> {
  final Random random = Random();
  final List<String> answers = const <String>[
    'Ask again later',
    'Yes',
    'No',
    'Maybe',
    'Definitely',
    'Not now',
    'Probably',
    'Unclear',
  ];

  int ballno = 0;

  void _shakeBall() {
    setState(() {
      ballno = random.nextInt(answers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text('Magic 8 Ball - PESUIO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 220,
              height: 220,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Text(
                  answers[ballno],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _shakeBall,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              ),
              child: const Text('Shake the Ball'),
            ),
          ],
        ),
      ),
    );
  }
}

