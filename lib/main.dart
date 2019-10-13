import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int firstNumber = Random().nextInt(99);
  int secondNumber = Random().nextInt(99);
  int score = 0;

  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('MathWizard'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '$firstNumber + $secondNumber = ',
                    style: TextStyle(
                      letterSpacing: 1.15,
                      color: Colors.blue,
                      fontSize: 36,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: BorderSide(width: 1)),
                      ),
                      controller: myController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 18),cursorColor: Colors.blue,

                    ),
                  ),
                ],
              ),
            ),
            Column(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    int sum = firstNumber + secondNumber;
                    sum == int.parse(myController.text) ? score = score + 5 : score = score - 5;
                    setState(() {
                      firstNumber = Random().nextInt(99);
                      secondNumber = Random().nextInt(99);
                    });
                    myController.clear();
                  },
                  child: Text('CHECK'),
                  textColor: Colors.white,
                ),
                ButtonTheme(
                    minWidth: 60,
                    height: 36,
                    child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          firstNumber = Random().nextInt(99);
                          secondNumber = Random().nextInt(99);
                        });
                      },
                      child: Text('SKIP'),
                      textColor: Colors.white,
                    )),
              ],
            ),

            Expanded(
                child: Center(
                  child: Text(
              'Score : $score',
              style: TextStyle(
                  letterSpacing: 1.15,
                  color: Colors.green,
                  fontSize: 48,
              ),
            ),
                )),
          ],
        ),
      ),
    );
  }
}
