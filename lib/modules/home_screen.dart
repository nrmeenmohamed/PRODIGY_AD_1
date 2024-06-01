
import 'package:calculator_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_expressions/math_expressions.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '=',
  ];
  String input = '';
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA91D3A),
        centerTitle: true,
        title: const Text(
          'calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_image.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              defaultText(
                text: input,
              ),
              SizedBox(height: 20.h,),
              defaultText(
                text: output,
                textAlign: TextAlign.right,
              ),
              Expanded(
                flex: 4,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => defaultContainer(
                      onTap: (){
                        if (symbols[index] == 'C') {
                          setState(() {
                            input = '';
                            output = '';
                          });
                        } else if (symbols[index] == 'Del') {
                          setState(() {
                            input = input.substring(0, input.length - 1);
                          });
                        } else if (symbols[index] == 'Ans') {
                          setState(() {
                            input = output;
                            output = '';
                          });
                        } else if (symbols[index] == '%' ||
                            symbols[index] == '/' ||
                            symbols[index] == '*' ||
                            symbols[index] == '+' ||
                            symbols[index] == '-') {
                          if (input.endsWith("%") ||
                              input.endsWith("*") ||
                              input.endsWith("/") ||
                              input.endsWith("+") ||
                              input.endsWith("-")) {
                            //
                          } else {
                            setState(() {
                              input += symbols[index];
                            });
                          }
                        } else if (symbols[index] == '=') {
                          Expression exp = Parser().parse(input);
                          double result =
                          exp.evaluate(EvaluationType.REAL, ContextModel());
                          setState(() {
                            output = result.toString();
                          });
                          //output
                        } else {
                          setState(() {
                            input += symbols[index];
                          });
                        }
                      },
                      text: symbols[index],
                  ),
                  itemCount: symbols.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
