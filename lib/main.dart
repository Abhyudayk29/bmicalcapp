import 'dart:math';

import 'package:flutter/material.dart';

import 'package:bmicalc/Second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 175;
  int weight = 75;
  double bmi = 0;
  double radius = 20.0;

  void add() {
    setState(() {
      weight++;
    });
  }

  void minus() {
    setState(() {
      if (weight != 0) weight--;
    });
  }

  void BMI() {
    setState(() {
      bmi = (weight / pow(height / 100, 2));
      print(bmi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,52, 52, 52),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.black,
      ),
      body:Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 2.0,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 2, color: Colors.deepPurple),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Weight in kgs:  ',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                    ),
                    ElevatedButton(
                      child:
                      Text("-".toUpperCase(), style: TextStyle(fontSize: 25)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.yellow)))),
                      onPressed: minus,
                    ),
                    Text('$weight',
                        style: TextStyle(fontSize: 60.0, color: Colors.yellow)),
                    ElevatedButton(
                      child:
                      Text("+".toUpperCase(), style: TextStyle(fontSize: 25)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.yellow)))),
                      onPressed: add,
                    )
                  ]),
            ),
            Container(
                height: 90,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height in cms : ${height.round()}",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.yellow,
                      ),
                    ),
                    Slider(
                        value: height,
                        min: 140,
                        max: 240,
                        activeColor: Colors.yellow,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                            print(height);
                          });
                        })
                  ],
                )),
            ElevatedButton(
              child: Text("Calculate"),
              style: ButtonStyle(
                  padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.yellow)))),
              onPressed:  () {BMI();
                Navigator.push(context,MaterialPageRoute(builder: (context){return SecondPage(bmi:bmi,);} ),);
              },
            ),
            SizedBox(height: 15),
            Text(
                bmi == null
                    ? "Enter Value"
                    : "Your BMI is: ${bmi.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
