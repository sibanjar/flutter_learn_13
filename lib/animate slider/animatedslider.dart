import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  int defaultInteger = 0;
  late String name;

  String firstWord = 'Player';
  String secondWord = 'Gamer';

  void setValue() async{
    // defaultInteger = value;
    setState(() {
      defaultInteger = (defaultInteger == 0) ? 1 : 0;
      if(defaultInteger == 0){
        setName2();
      }else{
        setName1();
      }
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      setName();
    });
  }

  void setName1() {
    if (defaultInteger == 0) {
      name = firstWord;
    } else {
      name = getMatchedLetters(firstWord, secondWord);
    }

  }
  void setName2() {
    if (defaultInteger == 0) {
      name = getMatchedLetters(secondWord, firstWord);
    } else {
      name =  secondWord;
    }

  }
  void setName() {
    if (defaultInteger == 0) {
      name = firstWord;
    } else {
      name = secondWord;
    }

  }

  String getMatchedLetters(String firstWord, String secondWord) {
    String matchedLetters = '';
    firstWord =firstWord.toLowerCase();
    secondWord =secondWord.toLowerCase();

    for (int i = 0; i < firstWord.length; i++) {
      if(secondWord.contains(firstWord[i])){
        if(i == 0){
          matchedLetters += firstWord[i].toUpperCase();
        }else{
          matchedLetters += firstWord[i];
        }
      }else{
        matchedLetters += ' ';
      }
    }
    return matchedLetters;
  }



  @override
  void initState() {
    setName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliderExample Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          AnimatedTextKit(
          animatedTexts: [

          TypewriterAnimatedText(name, textStyle: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 2000),
          ),
        ],

        totalRepeatCount: 4,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      )
        ]
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                setValue();
              },
              child: const Text('change'))
        ],
      ),
    );
  }
}
