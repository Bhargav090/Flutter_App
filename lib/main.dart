import 'package:demo_app/animated_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: const Splash_Page(),
      routes: {
        '/animated': (context) => const Animated_Page(),
      },
    );
  }
}

class Splash_Page extends StatelessWidget {
  const Splash_Page({Key? key});
  
  @override
  Widget build(BuildContext context) {
    // Delay before navigating to the next page
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Animated_Page()),
      );
    });
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor:Colors.deepPurple[50],
        body: Column(
          children: [
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage('lib/images/mainlogo.png'),
                  height: 70,
                  width: 70,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ME",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13.0),
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.deepPurple.shade400,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom:58.0),
              child: Text(
                "Your Personal Self Care Coach",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
