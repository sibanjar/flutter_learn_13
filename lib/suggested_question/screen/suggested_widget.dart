import 'package:flutter/material.dart';

import '../models/suggested_question_model.dart';
class SuggestionQuestionWidget extends StatelessWidget {
  const SuggestionQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<QuestionSuggestion> suggestedQuestions = [
      QuestionSuggestion(id: 1, title: 'First suggestion'),
      QuestionSuggestion(id: 2, title: 'Second suggestion'),
      QuestionSuggestion(id: 3, title: 'Third suggestion'),
      QuestionSuggestion(id: 4, title: 'Fourth suggestion'),
      QuestionSuggestion(id: 5, title: 'Fifth suggestion'),
      QuestionSuggestion(id: 6, title: 'Sixth suggestion'),
      QuestionSuggestion(id: 7, title: 'Seventh suggestion'),
      QuestionSuggestion(id: 8, title: 'Eighth suggestion'),
      QuestionSuggestion(id: 9, title: 'Ninth suggestion'),
      QuestionSuggestion(id: 10, title: 'Tenth suggestion'),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Suggested Questions'),),
      body: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:Colors.green
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text('Suggested Questions:',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),)),
              Expanded(
                  child: SizedBox(
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemCount: suggestedQuestions.length,
                      itemBuilder: (context,index){
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1,color: Colors.black),
                          ),
                          child: Text(suggestedQuestions[index].title!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,),),
                        );
                      },
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
