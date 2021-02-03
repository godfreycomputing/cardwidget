import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Questions(),
    );
  }
}

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: symptomCards.map((card) => card).toList(),
    );
  }
}

void _answerQuestion(bool answer, int id) {}

List<SymptomCard> symptomCards = <SymptomCard>[
  UnansweredCard(
    answerQuestion: _answerQuestion,
    id: 0,
    symptomData: SymptomData(
        answered: false, question: 'Question 1', symptom: 'Symptom 1'),
  ),
  UnansweredCard(
    answerQuestion: _answerQuestion,
    id: 0,
    symptomData: SymptomData(
        answered: false, question: 'Question 2', symptom: 'Symptom 2'),
  ),
  UnansweredCard(
    answerQuestion: _answerQuestion,
    id: 0,
    symptomData: SymptomData(
        answered: false, question: 'Question 3', symptom: 'Symptom 3'),
  ),
];

class SymptomCard extends StatelessWidget {
  final SymptomCard child;
  const SymptomCard(this.child);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class UnansweredCard extends SymptomCard {
  final SymptomData symptomData;
  final int id;
  final Function answerQuestion;

  UnansweredCard({this.symptomData, this.answerQuestion, this.id})
      : super(UnansweredCard(
          answerQuestion: answerQuestion,
          id: id,
          symptomData: symptomData,
        ));
  @override
  Widget build(BuildContext context) {
    return Card(
      color: symptomData.answered ? Colors.blue : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(symptomData.question),
          Row(
            children: [
              RaisedButton(
                child: Text('Yes'),
                onPressed: () => answerQuestion(true, id),
              ),
              RaisedButton(
                child: Text('No'),
                onPressed: () => answerQuestion(false, id),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnsweredCard extends SymptomCard {
  final SymptomData symptomData;

  AnsweredCard({this.symptomData})
      : super(AnsweredCard(
          symptomData: symptomData,
        ));
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Text(symptomData.symptom),
    );
  }
}

class SymptomData {
  final String symptom;
  final bool answered;
  final String question;

  SymptomData({this.symptom, this.answered, this.question});
}
