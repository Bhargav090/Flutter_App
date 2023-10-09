import 'package:flutter/material.dart';
import 'package:demo_app/ani_page3.dart';

class Ani_Page_2 extends StatefulWidget {
  const Ani_Page_2({Key? key});

  @override
  _Ani_Page_2State createState() => _Ani_Page_2State();
}

class _Ani_Page_2State extends State<Ani_Page_2>
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
        MaterialPageRoute(builder: (context) => const Ani_Page_3()),
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
              width: 155,
              height: 155,
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
                child: const Center(
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
                          'Positive',
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
