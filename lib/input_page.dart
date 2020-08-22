import 'resutlPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_ingredients.dart';
import 'reusable_card.dart';
import 'dart:math';

int cardBackgroundColor = 0xFF1D1E33;
const int active = 0x55EB1555;
const int inactive = 0xFF1D1E33;
const double bottomContainerHeight = 40;
enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 30;
  double _bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('B.M.I Calculator')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color: gender==Gender.male?active:inactive,
                    child: CardIngredients(cardIcon: Icons.directions_run,cardText: "MALE",),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color: gender==Gender.female?active:inactive,
                    child: CardIngredients(cardIcon: Icons.pregnant_woman,cardText: "FEMALE",),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: cardBackgroundColor,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: TextStyle(color: Colors.grey[400], fontSize: 60, fontWeight: FontWeight.w700)),
                        Text('cm', style: TextStyle(color: Colors.grey[400], fontSize: 15)),
                      ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                    min: 120,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Colors.grey[600],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: cardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(weight.toString(), style: TextStyle(color: Colors.grey[400], fontSize: 45, fontWeight: FontWeight.w700)),
                            Text('kg', style: TextStyle(color: Colors.grey[400], fontSize: 15)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButton(icon: Icons.close, onTap: (){setState(() {
                              weight--;
                            });},),
                            SizedBox(width: 10,),
                            CustomButton(icon: Icons.add, onTap: (){setState(() {
                              weight++;
                            });},)
                          ],
                        ),
                      ],
                    ),),
                ),
                Expanded(
                  child: ReusableCard(
                      color: cardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(age.toString(), style: TextStyle(color: Colors.grey[400], fontSize: 45, fontWeight: FontWeight.w700)),
                            Text('yr', style: TextStyle(color: Colors.grey[400], fontSize: 15)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButton(icon: Icons.close, onTap: (){setState(() {
                              age--;
                            });},),
                            SizedBox(width: 10,),
                            CustomButton(icon: Icons.add, onTap: (){setState(() {
                              age++;
                            });},)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 1),
            width: 200,
            height: bottomContainerHeight,
            child: OutlineButton(
              highlightedBorderColor: Color(0xFF0A0E21),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Results(bmiText: calculateBMI(),bmiResulttext: getResult(), bmiAdviceText: getAdvice(),)));
              },
              borderSide: BorderSide(color: Color(0xFFEB1555), width: 1),
              child: Text('CALCULATE', style: TextStyle(color: Color(0xFFEB1555), fontSize: 20),),
            ),
          ),
        ],
      )
      );
  }


  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else {
      return 'underweight';
    }
  }
  String getAdvice(){
    if (_bmi >= 25){
      return 'You need to eat less and exercise more.';
    }else if(_bmi > 18.5){
      return 'You need to maintain current results by exercising regularly.';
    }else {
      return 'You need to eat.';
    }
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, this.icon});
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
      fillColor: Colors.grey[800],
      shape: CircleBorder(),
      child: Icon(icon, color: Colors.grey[500],),
    );
  }
}

