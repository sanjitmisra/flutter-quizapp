import 'package:flutter/material.dart';
import 'package:quizapp/models/quiz_question.dart';

class Questions extends StatefulWidget {
  const Questions(this.questionsList, this.selectAnswer, {super.key});
  final List<QuizQuestion> questionsList;
  final void Function(String selectedAnswer, int questionId) selectAnswer;

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  answerQuestion(String answer) {
    setState(() {
      widget.selectAnswer(answer, currentQuestionIndex);
      // if (currentQuestionIndex < max) {
      currentQuestionIndex += 1;
      // }
    });
  }

  List<String> getAnswersShuffled(List<String> answers) {
    final List<String> shuffledAnswers = List.from(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            widget.questionsList[currentQuestionIndex].text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(width: 100, height: 30),
        // ...widget.answerOptions.map((option) {})

        for (var option in getAnswersShuffled(
            widget.questionsList[currentQuestionIndex].answers))
          ElevatedButton(
            onPressed: () {
              answerQuestion(option);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 39, 1, 53),
              minimumSize: const Size(300, 40),
            ),
            child: Text(option),
          ),
      ],
    );
  }
}
