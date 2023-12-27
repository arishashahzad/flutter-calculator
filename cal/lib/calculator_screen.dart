
import 'package:cal/button.dart';
import 'package:cal/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  var inputValue = "";
  var answer = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //main column of calculator
      body: Column(

        children: [

          ///calculator ka display 
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.black,

              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                       child: Text(inputValue,style: TextStyle(color: Colors.white, fontSize:answer.length>1?  30 : 70 ),),
                    ),
                  SingleChildScrollView( 
                    scrollDirection: Axis.horizontal,
                    child: Text(answer,style: TextStyle(color: Colors.white, fontSize: 70),),
                  ),
                    
                  ],
                ),
              ),
            ),
          ),
          
          


          ///calculator k buttons
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            
            Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalButton(btnValue: "A/c", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue= "";answer="";  });}, txtcolor:calcolor.txtdark),
                      CalButton(btnValue: "+/-", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="+\-";  });}, txtcolor:calcolor.txtdark),
                      CalButton(btnValue: "%", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="%";  });}, txtcolor:calcolor.txtdark),
                      CalButton(btnValue: "/", btncolor: calcolor.secondaryColor, onpress: (){setState((){  inputValue +="/";  });}, txtcolor:calcolor.txtLight),
                      
                    ],
            ),
              Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalButton(btnValue: "7", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="7";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "8", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="8";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "9", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="9";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "*", btncolor: calcolor.secondaryColor, onpress: (){setState((){  inputValue +="*";  });}, txtcolor:calcolor.txtLight),
                      
                    ],
            ),
                    Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalButton(btnValue: "4", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="4";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "5", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="5";  }); }, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "6", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="6";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "-", btncolor: calcolor.secondaryColor, onpress: (){setState((){  inputValue +="-";  });}, txtcolor:calcolor.txtLight),
                      
                    ],
            ),
              Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalButton(btnValue: "1", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="1";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "2", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="2";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "3", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="3";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "+", btncolor: calcolor.secondaryColor, onpress: (){setState((){  inputValue +="+";  });}, txtcolor:calcolor.txtLight),
                      
                    ],
            ),
              Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalButton(btnValue: "0", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="0";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "00", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +="00";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: ".", btncolor: calcolor.primarycolor, onpress: (){setState((){  inputValue +=".";  });}, txtcolor:calcolor.txtLight),
                      CalButton(btnValue: "=", btncolor: calcolor.secondaryColor, onpress: (){setState((){  equalButton();  });}, txtcolor:calcolor.txtLight),
                      
                    ],
            ),
                ],
              ),
            )
          )



        ],

      ),

    );
  }

  void equalButton(){
    Parser parser =Parser();

    Expression expression =parser.parse(inputValue);
    ContextModel contextModel =ContextModel();
      double eval = expression.evaluate( EvaluationType.REAL, contextModel);


    answer = eval.toString();
  }
}