import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //?
  var pages = [
    PageViewModel(
      title: 'First Page',
      body: 'First thing to do is to create a nice looking page...',
      image: Center(
        child: Image.asset('assets/1.png', height: 175),
      ),
      decoration: PageDecoration(
        pageColor: Color(0xff192a56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    PageViewModel(
      title: 'Second Page',
      body: 'You need to balance your diet routine, exercise, good raw food, sleep and outdoor activities.',
      image: Center(
        child: Image.asset('assets/2.png', height: 175),
      ),
      decoration: PageDecoration(
        pageColor: Color(0xff192a56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    PageViewModel(
      title: 'Last Page',
      body: 'You must be consistent in everyday exercise for being fit and healthy...',
      image: Center(
        child: Image.asset('assets/3.png', height: 175),
      ),
      decoration: PageDecoration(
        pageColor: Color(0xff192a56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  ];

  //?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        },
        onSkip: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        },
        showSkipButton: true,
        skip: const Icon(Icons.skip_next, color: Colors.white),
        next: const Icon(Icons.arrow_right, color: Colors.white),
        done: const Text("Done",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
