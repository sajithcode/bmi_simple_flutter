import 'package:flutter/material.dart';
import 'package:hexcoder_demo/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Male");
                          setState(() {
                            gender = 'M';
                          });
                        },
                        child: Container(
                          height: 200,
                          width: 175,
                          decoration: BoxDecoration(
                              color: gender == 'M' ?Colors.orange.withAlpha(150) : Colors.orange.withAlpha(50),
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.male,
                                size: 150,
                              ),
                              Text("Male"),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          print("Female");
                          setState(() {
                            gender = 'F';
                          });
                        },
                        child: Container(
                          height: 200,
                          width: 175,
                          decoration: BoxDecoration(
                              color: gender == 'F' ?Colors.orange.withAlpha(150) : Colors.orange.withAlpha(50),
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 150,
                              ),
                              Text("Female"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Height"),
                            Text(
                              "$height",
                              style: kInputLabelColor,
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height > 50) {
                                        height--;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);
                                      }
                                    });
                                    print(height);
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height < 220) {
                                        height++;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);
                                      }
                                    });
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Weight"),
                            Text(
                              "$weight",
                              style: kInputLabelColor,
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 30) {
                                        weight--;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);
                                      }
                                    });
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight < 220) {
                                        weight++;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);
                                      }
                                    });
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      const Text("BMI"),
                      Text(
                        bmi.toStringAsFixed(2),
                        style: const TextStyle(
                            color: kOutputColor,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(getResult(bmi)),
                    ],
                  )
                ],
              ))),
    );
  }

  double calculateBMI({
    required height,
    required int weight,
  }) {
    return (weight / (height * height)) * 10000;
  }

  static String getResult(bmiValue) {
    if (bmiValue < 18.5) {
      return "Underweight";
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      return "Normal";
    } else if (bmiValue >= 25 && bmiValue < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
}
