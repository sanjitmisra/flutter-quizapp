import 'package:flutter/material.dart';

class ResultsDetails extends StatelessWidget {
  const ResultsDetails(this.listOfResponses, {super.key});
  final List<Map<String, Object>> listOfResponses;

  @override
  Widget build(context) {
    int questionCounter = 0;
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: listOfResponses.map((response) {
            questionCounter++;
            return Row(children: [
              CircleAvatar(
                  backgroundColor:
                      response['given_answer'] == response['correct_answer']
                          ? const Color.fromARGB(170, 102, 246, 80)
                          : const Color.fromARGB(255, 206, 12, 224),
                  child: Text(
                    questionCounter.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                        width: 50,
                      ),
                      Text(response['question'] as String,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      // Text(response['question'] as String),
                      Text(
                        response['given_answer'] as String,
                        style: TextStyle(
                          color: response['given_answer'] ==
                                  response['correct_answer']
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(response['correct_answer'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ]),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
