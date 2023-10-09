import 'package:demo_app/ani_page4.dart';
import 'package:flutter/material.dart';

class Ani_Page_3 extends StatefulWidget {
  const Ani_Page_3({Key? key});

  @override
  _Ani_Page_3State createState() => _Ani_Page_3State();
}

class _Ani_Page_3State extends State<Ani_Page_3>
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
        MaterialPageRoute(builder: (context) => Ani_Page_4()),
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
              width: 185,
              height: 185,
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
                          'Enegertic',
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
