import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playground/screen/modules/bmi/bmi_result_screen.dart';
import 'package:flutter_playground/screen/shared/components/primary_button.dart';


extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double height = 120.0;
  bool isMale = true;
  int age = 0;
  int weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child:
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         isMale = true;
                       });

                     },
                     child: Container(
                       color: isMale ? Colors.red: Colors.blue,
                       child: const Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           SizedBox(
                               width: 60.0,
                               child: Padding(
                                 padding: EdgeInsets.all(8.0),
                                 child: Image(image: AssetImage("assets/images/male.jpg"),),
                               ),
                           ),
                           Text("Male", style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.w900
                           ),)
                         ],
                       ),
                     ),
                   ),
                ),
                Expanded(child:
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    color: isMale? Colors.blue: Colors.red,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 60,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(image: AssetImage("assets/images/female.jpg")),
                            ),
                             ),
                        Text("Female", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900
                        ),)
                      ],
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                color: Colors.green,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 15.0
                      ),
                      child: Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('$height', style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0
                          ),),
                          const Text('CM', style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0
                          ),)
                        ],
                      ),
                    ),
                    Slider(
                        value: height.toPrecision(2),
                        min: 80.0,
                        max: 190.0,
                        onChanged: (value){
                        setState(() {
                        height = value.toPrecision(2);
                      });
                    })
                  ],
                ),
              )
          ),
          Expanded(
              child:  Container(
                color: Colors.orange,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const Text('Age', style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 30.0
                           ),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('$age', style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0
                              ),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    child: const Icon(Icons.add),
                                    onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                }),
                                const SizedBox(width: 20,),
                                FloatingActionButton(
                                    child: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });

                                    }),
                              ],
                            ),
                          ],
                        )
                    ),
                    Expanded(
                        child: Container(
                          color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Weight', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0
                              ),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('$weight', style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0
                                ),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      child: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                  const SizedBox(width: 20,),
                                  FloatingActionButton(
                                      child: const Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });

                                      }),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              )
          ),
         primaryButton(title: "Calculate", function: () {
           print("calculate btn ......");
           double result = weight / pow(height / 100, 2);
           print(result.round());
           Navigator.push(context, MaterialPageRoute(
               builder: (context) => BMIResultScreen(result: result.round(), height: height, weight: weight)
           ));
         })
        ],
      ),
    );
  }
}
