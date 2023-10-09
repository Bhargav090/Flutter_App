import 'package:demo_app/ani_page2.dart';
import 'package:flutter/material.dart';

class Animated_Page extends StatefulWidget {
  const Animated_Page({Key? key});

  @override
  _Animated_PageState createState() => _Animated_PageState();
}

class _Animated_PageState extends State<Animated_Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    _controller.forward().whenComplete(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ani_Page_2()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.yellow.shade400,
                Colors.yellow.shade100,
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.yellow.shade400,
                      Colors.white,
                    ],
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: OverflowBox(
                    maxWidth: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          'More',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Healthy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
