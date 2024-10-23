import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 121, 212, 254)),
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  TextEditingController num1Add = TextEditingController();
  TextEditingController num2Add = TextEditingController();
  TextEditingController num1Sub = TextEditingController();
  TextEditingController num2Sub = TextEditingController();
  TextEditingController num1Mul = TextEditingController();
  TextEditingController num2Mul = TextEditingController();
  TextEditingController num1Div = TextEditingController();
  TextEditingController num2Div = TextEditingController();

  double resultA = 0;
  double resultS = 0;
  double resultM = 0;
  double resultD = 0;

  // Function to perform addition
  void _add() {
    setState(() {
      double firstNum = double.tryParse(num1Add.text) ?? 0;
      double secondNum = double.tryParse(num2Add.text) ?? 0;
      resultA = firstNum + secondNum;
    });
  }

  void _subtract() {
    setState(() {
      double firstNum = double.tryParse(num1Sub.text) ?? 0;
      double secondNum = double.tryParse(num2Sub.text) ?? 0;
      resultS = firstNum - secondNum;
    });
  }

  void _multiply() {
    setState(() {
      double firstNum = double.tryParse(num1Mul.text) ?? 0;
      double secondNum = double.tryParse(num2Mul.text) ?? 0;
      resultM = firstNum * secondNum;
    });
  }

  void _divide() {
    setState(() {
      double firstNum = double.tryParse(num1Div.text) ?? 0;
      double secondNum = double.tryParse(num2Div.text) ?? 0;
      if (secondNum != 0) {
        resultD = firstNum / secondNum;
      } else {
        resultD = double.nan; 
      }
    });
  }

  void _clear() {
    setState(() {
      num1Add.clear();
      num2Add.clear();
      num1Sub.clear();
      num2Sub.clear();
      num1Mul.clear();
      num2Mul.clear();
      num1Div.clear();
      num2Div.clear();
      resultA = 0;
      resultS = 0;
      resultM = 0;
      resultD = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //ADDITION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: num1Add,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                const Text(" + "),
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    controller: num2Add,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                Text(' =  $resultA'),
                SizedBox(width: 40,),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _add,
                  iconSize: 15,
                  padding: EdgeInsets.all(5),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white
                  ),
                ),
              ],
            ),

            // SUBTRACTION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: num1Sub,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                const Text(" - "),
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    controller: num2Sub,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                Text(' = $resultS'),
                SizedBox(width: 40,),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _subtract,
                  iconSize: 15,
                  padding: EdgeInsets.all(5),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white
                  ),
                ),
              ],
            ),

            // MULTIPLICATION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: num1Mul,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                const Text(" × "),
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    controller: num2Mul,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                Text(' = $resultM'),
                SizedBox(width: 40,),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _multiply,
                  iconSize: 15,
                  padding: EdgeInsets.all(5),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white
                  ),
                ),
              ],
            ),

            // DIVISION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: num1Div,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                const Text(" ÷ "),
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    controller: num2Div,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 15,),
                Text(' = $resultD'),
                SizedBox(width: 40,),
                SizedBox(),
                IconButton(
                  icon: const Icon(Icons.percent),
                  onPressed: _divide,
                  iconSize: 15,
                  padding: EdgeInsets.all(5),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white
                  ),
                ),
              ],
            ),

            // CLEAR
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
              onPressed: _clear,
              child: const Text("Clear Input"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.white,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
