import 'package:flutter/material.dart';
import 'package:quizapp/columns.dart';
// import 'package:learner_project/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class ParentContainer extends StatelessWidget {
  const ParentContainer(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColumnBuilder(startQuiz),
    );
  }
}
