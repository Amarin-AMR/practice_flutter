import 'package:bmiapp/constants.dart';
import 'package:flutter/material.dart';
import '../components/reuseable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI RESULT"),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Text(
            'Your Result',
            style: ktitleTextStyle,
          )),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              data: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: bmiText,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.justify,
                      style: describeTextStyle,
                    )
                  ],
                ),
              ),
              colour: Colors.grey,
              onPress: () {},
            ),
          ),
          ReuseableCard(
              data: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                child: const Text(
                  'RE-Calculator',
                  style: recalButtonText,
                ),
              ),
              colour: Colors.red,
              onPress: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
