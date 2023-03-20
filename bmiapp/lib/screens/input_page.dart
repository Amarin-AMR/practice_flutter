import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../calculator_brain.dart';

enum Gender { male, female }

double _value = 150.0;
double weight = 2;
int age = 25;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColour = activeCardcolour;
  // Color femaleCardColour = activeCardcolour;
  Gender? selectedgender;

  // void updateColour(Gender selectedgender){
  //   //male pressed
  //   if(selectedgender == Gender.male){
  //     if(maleCardColour == activeCardcolour){
  //       maleCardColour = inactiveCardcolour;
  //       femaleCardColour = activeCardcolour;
  //     }
  //     else{
  //       maleCardColour = activeCardcolour;

  //     }
  //   }

  //   //female preseed
  //   if(selectedgender == Gender.female){
  //     if(femaleCardColour == activeCardcolour){
  //       femaleCardColour = inactiveCardcolour;
  //       maleCardColour = activeCardcolour;
  //     }
  //     else{
  //       femaleCardColour = activeCardcolour;

  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CAL'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    data: IconContent(
                      icon: Icons.male,
                      b: 'MALE',
                    ),
                    // colour: check? inactiveCardcolour:activeCardcolour ,
                    colour: selectedgender == Gender.male
                        ? kInactiveCardcolour
                        : kActiveCardcolour,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    data: IconContent(icon: Icons.female, b: 'FEMALE'),
                    // colour: check?activeCardcolour:inactiveCardcolour,
                    colour: selectedgender == Gender.female
                        ? kInactiveCardcolour
                        : kActiveCardcolour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              onPress: () {},
              data: Column(
                children: [
                  const Text('HEIGHT'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${_value.toInt()} cm',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Slider(
                    min: 0.0,
                    max: 220.0,
                    value: _value,
                    activeColor: const Color(0xffeb1555),
                    inactiveColor: const Color(0xff8d8e98),
                    onChanged: (v) {
                      setState(() {
                        _value = v;
                      });
                    },
                  )
                ],
              ),
              colour: kActiveCardcolour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {},
                    data: Column(
                      children: [
                        const Text('WEIGHT'),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton.small(
                              hoverColor: const Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  if (weight < 0) {
                                    weight = 0;
                                  }
                                });
                              },
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton.small(
                              hoverColor: const Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardcolour,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {},
                    data: Column(
                      children: [
                        const Text('AGE'),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton.small(
                              hoverColor: const Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  age--;
                                  if (age < 0) {
                                    age = 0;
                                  }
                                });
                              },
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton.small(
                              hoverColor: const Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.add),
                            ),
                            // FloatingActionButton.small(onPressed: null,child: Icon(Icons.add),)
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardcolour,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   color: kBottomContainerColour,
          //   margin: EdgeInsets.only(top: 10.0),
          //   width: double.infinity,
          //   height: kBottomContainerHeight,
          //   child: Text('CAL'),
          // ),
          ReuseableCard(
            data: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Calculate',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            colour: kBottomContainerColour,
            onPress: () {
              CalculatorBrain calc = CalculatorBrain(
                height: _value.toInt(),
                weight: weight.toInt(),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
