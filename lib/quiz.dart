import 'package:flutter/material.dart';
import 'package:quizapp/parent.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/data/questions_list.dart';
import 'package:quizapp/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  List<Map<String, Object>> mapOfQuestionAnswers = [];

  @override
  void initState() {
    activeScreen = ParentContainer(switchScreen);
    super.initState();
  }

  void onRestartQuizButtonPress() {
    setState(() {
      selectedAnswers = [];
      mapOfQuestionAnswers = [];
      activeScreen = Questions(questionsList, onAnswerSelection);
    });
  }

  void onAnswerSelection(String answer, int questionId) {
    selectedAnswers.add(answer);
    mapOfQuestionAnswers.add({
      'question': questionsList[questionId].text,
      'correct_answer': questionsList[questionId].answers[0],
      'given_answer': answer
    });
    if (selectedAnswers.length == questionsList.length) {
      selectedAnswers = [];
      setState(() {
        activeScreen = ResultsScreen(
          listOfAnswers: mapOfQuestionAnswers,
          onRestart: onRestartQuizButtonPress,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(questionsList, onAnswerSelection);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurple],
                begin: startAlignment,
                end: endAlignment),
          ),
          child: activeScreen),
    ));
  }
}
