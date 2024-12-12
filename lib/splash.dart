import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return const PuzzleScreen();
          },
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.limeAccent,
          ],
        )),
        child: Center(
          child: Lottie.asset(
            'asstes/Lottie/Animation - 1733983396997.json',
          ),
        ),
      ),
    );
  }
}
