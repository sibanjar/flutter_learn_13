import 'dart:developer';

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
              Animate(
                  effects: [FadeEffect(duration:200.ms,curve: Curves.easeIn)],
                  child: Text(name, style: Theme.of(context).textTheme.titleLarge)),
            ],
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
