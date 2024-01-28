import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimation(),
    );
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String _firstWord;
  late String _secondWord;
  late String _currentWord;

  @override
  void initState() {
    super.initState();
    _firstWord = 'animation';
    _secondWord = 'flutter';
    _currentWord = _firstWord;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_currentWord == _firstWord) {
          _currentWord = _secondWord;
        } else {
          _currentWord = _firstWord;
        }
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // Animation completed, no action needed
      }
    });

    _controller.forward();
  }

  String _shuffleWord(String word) {
    List<String> characters = word.split('');
    characters.shuffle();
    return characters.join();
  }

  Widget _buildSlidingLetters() {
    List<Widget> letterWidgets = _currentWord.split('').map((letter) {
      int index = _currentWord.indexOf(letter);
      double slideValue = Curves.easeInOutQuad.transform(_controller.value) * index * 30.0;

      return Transform.translate(
        offset: Offset(slideValue, 0.0),
        child: Text(
          letter,
          style: const TextStyle(fontSize: 24.0),
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: letterWidgets,
    );
  }

  void _startAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSlidingLetters(),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _startAnimation,
              child: const Text('Transition'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
