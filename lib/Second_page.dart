import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class SecondPage extends StatelessWidget{
  double bmi;
  double radius = 20.0;
  SecondPage({required this.bmi,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255,52, 52, 52),
        appBar: AppBar(
          title: Text("Result", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),

        body:
        Center(

            child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      bmi == null ? "Enter Value" : "Your BMI is: ${bmi.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      )),
                  if (18.5 < bmi ) ...[
                    if (bmi < 24.9) ...[
                      Text("You're BMI is normal.",
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 40
                        ),)
                    ]
                  ],
                  if (18.5 > bmi)...[
                    Text("You're underweight!",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 40
                      ),)
                  ],
                  if (bmi > 24.9) ...[
                    Text("You're overweight!",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 40)
                    ),
                  ],
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.pinkAccent,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Container(
                    height: 90,
                    width: 400,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255,52, 52, 52),
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(
                        color: Color.fromARGB(255,52, 52, 52),
                        width: 2.0,
                      ),
                    ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text(
                               "Please leave us a rating! ",
                             style: TextStyle(
                            fontSize: 30,
                             color: Colors.yellow,
                             ),
                   ),
    ]
                    )




                  )

                ]
            )
        )
    );
  }

}