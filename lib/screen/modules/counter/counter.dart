import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Container(
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
                    child: Text('MINUS')
                ),
                Text(
                  "$counter",
                  style: TextStyle(
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
                    child: Text("PLUS")
                )
              ],
            ),
          ],
        ),
      ) ,
    );

  }
}
