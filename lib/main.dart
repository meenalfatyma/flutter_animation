import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Screen Challenge',
      home: TellsScreen(),
    );
  }
}

class TellsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
           const Color.fromRGBO(120, 11, 50, 50),
          Color.alphaBlend(Colors.yellowAccent, Colors.yellowAccent),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: topPadding),
                const SizedBox(height: 10),
                AnimatedImage(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Thoughts Corner",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                width: 300,
                  child: Center(
                    child: TextField(
                      cursorColor: Colors.black,

                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.pinkAccent,
                        hintText: 'Your thoughts here',
                        hintStyle: TextStyle(color: Colors.white38),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    )

                  ),
                ),


              ],

            ),
          ),
        ),

      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.10),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        SlideTransition(
          position: _animation,
          child: Image.asset('assets/person.png',),
        ),

      ],


    );
  }
}
