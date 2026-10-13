import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: summaryData.map((data) {
          final isCorrect = data['user_answer'] == data['correct_answer'];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCorrect ? Colors.green : Colors.redAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Vaša odpoveď: ${data['user_answer']}',
                      style: TextStyle(
                        color: isCorrect
                            ? Colors.greenAccent
                            : const Color.fromARGB(255, 255, 145, 145),
                      ),
                    ),
                    Text(
                      'Správna odpoveď: ${data['correct_answer']}',
                      style: const TextStyle(
                        color: Colors.greenAccent,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
