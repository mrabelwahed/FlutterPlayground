import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){
                      setState(() {
                        counter--;
                        print(counter);
                      });
                    },
                    child: const Text('MINUS')
                ),
                Text(
                  "$counter",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                TextButton(
                    onPressed: (){
                      setState(() {
                        counter++;
                        print(counter);
                      });

                    },
                    child: const Text("PLUS")
                )
              ],
            ),
          ],
        ),
      ) ,
    );

  }
}
